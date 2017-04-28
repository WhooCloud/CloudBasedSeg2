local server = require "resty.websocket.server"
local cjson = require "cjson.safe"
local ffi = require "ffi"
--local slamInterface = ffi.load("libslamInterface.so")
local zlib = ffi.load(ffi.os == "Windows" and "zlib1" or "z")

if pcall(function () return slamInterface.FFIInterface end) then
    -- do nothing
else
ffi.cdef[[
    unsigned long compressBound(unsigned long sourceLen);
    int compress2(uint8_t *dest, unsigned long *destLen,
              const uint8_t *source, unsigned long sourceLen, int level);
    int uncompress(uint8_t *dest, unsigned long *destLen,
               const uint8_t *source, unsigned long sourceLen);     
]]
end

local function directory_exists( sPath )
  local ok = os.execute("cd "..sPath)
  if not ok then
    return false
  else
    return true
  end
end

local function compress(txt)
  local n = zlib.compressBound(#txt)
  local buf = ffi.new("uint8_t[?]", n)
  local buflen = ffi.new("unsigned long[1]", n)
  local res = zlib.compress2(buf, buflen, txt, #txt, 9)
  assert(res == 0)
  return ffi.string(buf, buflen[0])
end

local function uncompress(comp, n)
  local buf = ffi.new("uint8_t[?]", n)
  local buflen = ffi.new("unsigned long[1]", n)
  local res = zlib.uncompress(buf, buflen, comp, #comp)
  assert(res == 0)
  return ffi.string(buf, buflen[0])
end

local function receiveData(wb)
    local data, typ, err = wb:recv_frame()
    if not data then
        ngx.log(ngx.ERR, "failed to receive a frame: ", err)
        return ngx.exit(444)
    end
    if typ == "text" or typ == "binary" then
        ngx.log(ngx.INFO, "received Data: ", data, " (", typ, ") ");
        return data
    else
        ngx.log(ngx.ERR, "failed to receive Data, ", "the type is: ", typ)
        return nil
    end                                                                         
end

local function sendData(wb, result)
  local bytes, err = wb:send_binary(compress((result)))
  if not bytes then
    ngx.log(ngx.ERR, "failed to send a text frame: ", err)
    return ngx.exit(444)
  end
end

--Initial WebScoket Server
local wb, err = server:new{
    --timeout = 30,  -- in milliseconds
    max_payload_len = 200*1024,
}
if not wb then
    ngx.log(ngx.ERR, "failed to new websocket: ", err)
    return ngx.exit(444)
end

local robot_id = nil
local root_path = "/home/ubuntu/CloudBasedSeg2/CLOUD_BASED_VO_SERVER/"
local robot_path = nil
local result = {type = "result", message = "OK"}

--Initial Message
local data = uncompress(receiveData(wb), 200*1024)
local json_data = cjson.decode(data)

if json_data then
  ngx.log(ngx.INFO, "robot_id: ", json_data.robot_id)
  ngx.log(ngx.INFO, "type: ", json_data.type)

  if json_data.type == "initial" then
    robot_id = json_data.robot_id
    robot_path = root_path .. "ServerData/" .. robot_id.."/"
    ngx.log(ngx.INFO, "robot_path: ", robot_path)

    if directory_exists(robot_path) then
        ngx.log(ngx.INFO, robot_path .. " exists")
    else
        --local cmd_string = "mkdir " .. robot_path
        local cmd_string = "cp -r " .. root_path .. "ServerData/0000".. " " ..robot_path
        local cmd_ok = os.execute(cmd_string)
        if not cmd_ok then
          result.message = "ERROR:".."mkdir " .. robot_path.."FAILED."
        else
          result.message = "OK"
        end
    end
  else
    result.message = "ERROR:Message cannnot be identified."
  end

else
  result.message = "ERROR:Message cannnot be parsed."
end
sendData(wb, cjson.encode(result));
while true 
do
    data = uncompress(receiveData(wb), 200*1024)
    json_data = cjson.decode(data)
    if json_data then
      ngx.log(ngx.INFO, "command: ", json_data.type)
      ngx.log(ngx.INFO, "state: ", json_data.upload)
      -- result.message = "OK"
      if json_data.type == "command" then
        if json_data.upload == "ok" then
            local python_path = "/home/ubuntu/pynb/caffe-future/server_inference.py"
            local python_i = json_data.filename
            local python_o = "inference.jpg"
            local python_log_path = root_path .. "ServerData/" .. robot_id .. "/" .. "python.log"
            local cmd_string = "python " ..python_path  .. " -i ".. python_i.." -o "..python_o.." -r "..robot_id.." > " .. python_log_path
            ngx.log(ngx.INFO, "cmd_string: ", cmd_string)
            local cmd_ok = os.execute(cmd_string)
            if not cmd_ok then
              result.message = "ERROR:"..cmd_string.."FAILED"
            else
              result.message = "OK"
            end
        else
            result.message = "ERROR:HTTP uploading file seems failed."
        end
      else
        result.message = "ERROR:Message cannot be identified."
      end
    else
      result.message = "ERROR:Message cannnot be parsed."
    end
    sendData(wb, cjson.encode(result));
end


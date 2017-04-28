local resty_md5 = require "resty.md5"
local upload = require "resty.upload"
local str = require "resty.string"
local root_path = "/home/ubuntu/CloudBasedSeg2/CLOUD_BASED_VO_SERVER/"
local dst_dir = root_path .. "ServerData"


function get_filename(res)
    local filename = ngx.re.match(res, '(.+)filename="(.+)"(.*)')
    if filename then
        return filename[2]
    end
end

function get_robot_id(res)
    local filename = ngx.re.match(res, '(.+); name="(.+)"; filename=(.*)')
    if filename then
        return filename[2]
    end
end


function handle_uploading()
    local chunk_size =4*1024
    local form, err = upload:new(chunk_size)
    if not form then
        ngx.log(ngx.ERR, "failed to new upload: ", err)
        ngx.exit(500)
    end
    file_name = ""
    file = nil
    while true do
        local typ, res, err = form:read()

        if not typ then
            ngx.say("failed to read: ", err)
            return
        end

        if typ == "header" then
            ngx.say(res)
            file_name = get_filename(res[2])
            local robot_id = get_robot_id(res[2])
            if robot_id then
                ngx.log(ngx.INFO, "robot_id for uploading: ", robot_id)
                if file_name then
                    file,err = io.open(dst_dir .. '/' .. robot_id .. '/' .. file_name, "w+")
                    if not file then
                        ngx.say("failed to open file: ", dst_dir .. '/' .. robot_id .. '/' .. file_name)
                        ngx.say(err)
                        return
                    end
                end
            end

        elseif typ == "body" then
            if file then
                file:write(res)
            end
        elseif typ == "part_end" then
            if file then
                file:close()
                file = nil
            end

        elseif typ == "eof" then
            break
        else
            --do nothing
        end
    end
    if file_name then
        return dst_dir .. "/".. file_name
    else
        return "filename not get"
    end
end

handle_uploading()

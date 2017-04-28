#/bin/bash
#wget https://openresty.org/download/openresty-1.11.2.2.tar.gz
#cd
#sudo apt-get update
#sudo apt-get install -y libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential
#
#tar -xzvf openresty-1.11.2.2.tar.gz
#cd openresty-1.11.2.2
#sudo ./configure -j8
#make -j8
#sudo make install -j8

#sudo apt-get -y install git
#git clone https://github.com/WhooCloud/CloudBasedSeg2.git
#
#sudo apt-get update
## python
#sudo apt-get install -y python-dev
#sudo apt-get install -y libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk
## pip
#sudo apt-get install -y pip
#sudo apt-get install -y cmake make
Manu: conf/nginx.conf
change 
	alias /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_SERVER/ServerData/;
into 
	alias <path to ServerData/>
Note: '/' has to be attached to this path

Manu: logs/nginx.pid
remove nginx.pid

Manu: lua/seg_upload.lua
change
	local root_path = "/home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_SERVER/"
into
	local root_path = "path to CLOUD_BASED_VO_SERVER"
Note: '/' has to be attached to this path

Manu: lua/seg.lua
change
        local root_path = "/home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_SERVER/"
into
        local root_path = "path to CLOUD_BASED_VO_SERVER"

change 
        local python_path = root_path .. "python/" .. "test.py"
into
	local python_path = "path to your python path"	

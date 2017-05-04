import caffe
import sys
sys.path.append('/root/CloudBasedSeg2/caffe-future/')
import surgery, score
import numpy as np
import os
import setproctitle
import shutil
import getopt

opts, args = getopt.getopt(sys.argv[1:], "hr:i:")
robot_id = ""
for op, value in opts:
    if op == "-r":
        robot_id = value
    elif op == "-h":
        print("This is the help message!")
        sys.exit()
    elif op == "-i":
	iteration = value

def apply_gpu(_gpu_pool_path, robot_id):
    try:
        os.rename(_gpu_pool_path, _gpu_pool_path+'.'+robot_id)
    except OSError:
#        print "Error:", _gpu_pool_path, "is unaccessable."
        return -1
    else:
        gpu_pool_path = _gpu_pool_path+'.'+robot_id
        fp = open(gpu_pool_path, 'r')
        gpu_pool = fp.readlines()
        if(len(gpu_pool) == 0):
            fp.close()
#            print "Error: None GPU is available.", 
            gpu_id = -2
        else:
            gpu_id = gpu_pool[0]
            fp.close()
            fp = open(gpu_pool_path, 'w')
            fp.writelines(gpu_pool[1:])
            fp.close()
        os.rename(gpu_pool_path, _gpu_pool_path)
        return int(gpu_id)

def clear_null_line(filepath):
    fp = open(filepath, 'r')
    lines = fp.readlines()
    i = 0;
    for line in lines:
        if(len(line.strip())==0):
            del lines[i]
        i = i+1
    fp.close()
    fp = open(filepath, 'w')
    fp.writelines(lines)
    fp.close()
    
def release_gpu(_gpu_pool_path, robot_id, gpu_id):
    try:
        os.rename(_gpu_pool_path, _gpu_pool_path+'.'+robot_id)
    except OSError:
#         print "Error:", _gpu_pool_path, "is unaccessable."
        return False
    else:
        gpu_pool_path = _gpu_pool_path+'.'+robot_id
        fp = open(gpu_pool_path, 'a')
        fp.write('\n')
        fp.write(str(gpu_id))
        fp.close()
        clear_null_line(gpu_pool_path)
        os.rename(gpu_pool_path, _gpu_pool_path)
        print "GPU", gpu_id, "is released."
        return True

setproctitle.setproctitle(os.path.basename(os.getcwd()))
rootpath = '/root/CloudBasedSeg2/CLOUD_BASED_VO_SERVER/ServerData/'+robot_id+'/'
weights = rootpath +'server.caffemodel'
weightssavepath = weights
gpu_id = -1
gpu_pool_path = rootpath + '../gpu_pool.txt'
##apply GPU
while (gpu_id < 0): 
    print gpu_id
    gpu_id = apply_gpu(gpu_pool_path, robot_id)

caffe.set_device(gpu_id)
caffe.set_mode_gpu()

path = rootpath
#dirlist = os.listdir(path + 'img/')
# init
solver = caffe.SGDSolver(rootpath + 'solver.prototxt')
solver.net.copy_from(weights)

# surgeries
interp_layers = [k for k in solver.net.params.keys() if 'up' in k]
surgery.interp(solver.net, interp_layers)

# scoring
val = np.loadtxt(path + 'train.txt', dtype=str)

num_iter = 1
num_batch = int(iteration)

for i in range(num_iter):
    solver.step(num_batch)
    solver.net.save(weightssavepath)  

##release GPU
release_ok = release_gpu(gpu_pool_path, robot_id, gpu_id)
while(not release_ok) :
    release_ok = release_gpu(gpu_pool_path, robot_id, gpu_id)

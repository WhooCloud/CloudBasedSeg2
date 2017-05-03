import caffe
import sys
sys.path.append('/home/ubuntu/pynb/caffe-future/')
import surgery, score
import numpy as np
import os
import setproctitle
import shutil

setproctitle.setproctitle(os.path.basename(os.getcwd()))
rootpath = '/home/ubuntu/pynb/caffe-future/train/'
weights = rootpath +'model/_iter_100.caffemodel'
weightssavepath = rootpath +'model/'
caffe.set_device(0)
caffe.set_mode_gpu()

path = rootpath + 'dataset/'
dirlist = os.listdir(path + 'img/')
# init
solver = caffe.SGDSolver(rootpath + 'config/solver.prototxt')
solver.net.copy_from(weights)

# surgeries
interp_layers = [k for k in solver.net.params.keys() if 'up' in k]
surgery.interp(solver.net, interp_layers)

# scoring
val = np.loadtxt(path + 'test.txt', dtype=str)

num_iter = 400
num_batch = 100

for i in range(num_iter):
    solver.step(num_batch)
    acc,iu = score.seg_tests(solver, False, val, layer='score')
    solver.net.save(weightssavepath + '_iter_' + str(i*num_batch) + '.caffemodel' )  


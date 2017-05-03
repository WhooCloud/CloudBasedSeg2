import numpy as np
import scipy.io
import caffe
import os
import random
import time

from scipy import misc
from scipy import ndimage
from PIL import Image
from PIL import ImageFilter
import matplotlib.pyplot as plt

import sys, getopt
opts, args = getopt.getopt(sys.argv[1:], "hi:o:r:")
i_path = ""
o_path = ""
robot_id=""
for op, value in opts:
    if op == "-i":
        i_path = value
    elif op == "-o":
        o_path = value
    elif op == "-r":
        robot_id = value
    elif op == "-h":
        print("This is the help message!")
        sys.exit()

def apply_gpu(_gpu_pool_path, robot_id):
    try:
        os.rename(_gpu_pool_path, _gpu_pool_path+'.'+robot_id)
    except OSError:
#         print "Error:", _gpu_pool_path, "is unaccessable."
        return -1
    else:
        gpu_pool_path = _gpu_pool_path+'.'+robot_id
        fp = open(gpu_pool_path, 'r')
        gpu_pool = fp.readlines()
        if(len(gpu_pool) == 0):
            fp.close()
#             print "Error: None GPU is available.", 
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
    
def imageProcess(inferfile):
    inference = Image.open(inferfile)
    inference = inference.filter(ImageFilter.MedianFilter(9))

    infer = np.array(inference)
    infer = infer[:,:,0]    

    label_im, nb_labels = ndimage.label(infer)
    sizes = ndimage.sum(infer, label_im, range(nb_labels + 1))
    maxsize = sizes.argsort()[-1]
    mask_size = np.ones(sizes.size, dtype = 'bool')
    mask_size[maxsize] = 0
    remove_pixel = mask_size[label_im]
    infer[remove_pixel] = 0
    return infer


rootpath = '/home/ubuntu/CloudBasedSeg2/CLOUD_BASED_VO_SERVER/ServerData/' + robot_id + '/'
deploypath = rootpath + 'deploy.prototxt'
weightspath = rootpath + '_iter_12000.caffemodel'
imagepath = rootpath + i_path
outimagepath = rootpath + o_path
gpu_id = -1
gpu_pool_path = '/home/ubuntu/CloudBasedSeg2/CLOUD_BASED_VO_SERVER/ServerData/' + './gpu_pool.txt'
##apply GPU
while (gpu_id < 0): 
    gpu_id = apply_gpu(gpu_pool_path, robot_id)
##inference    
caffe.set_device(gpu_id)
caffe.set_mode_gpu()

net = caffe.Net(deploypath, weightspath, caffe.TEST)

im = Image.open(imagepath)
in_ = np.array(im, dtype=np.float32)
in_ = in_[:,:,::-1]
in_ -= np.array((104.00698793,116.66876762,122.67891434))
in_ = in_.transpose((2,0,1))

net.blobs['data'].reshape(1, *in_.shape)
net.blobs['data'].data[...] = in_

net.forward()
out = net.blobs['score'].data[0].argmax(axis=0)
temp = np.array([out,out,out], dtype = 'uint8')
temp = temp.transpose([1,2,0])
outimage = Image.fromarray(temp)
outimage.save(outimagepath, 'jpeg')

infer = imageProcess(outimagepath)
image = misc.imread(imagepath)
mask_carpet = infer == 1
image[mask_carpet] = [255,0,0]

saveimage= Image.fromarray(image)
saveimage.save(outimagepath, 'jpeg')
##release GPU
release_ok = release_gpu(gpu_pool_path, robot_id, gpu_id)
while(not release_ok) :
    release_ok = release_gpu(gpu_pool_path, robot_id, gpu_id)
#if __name__ == '__main__':
#    inferrobot('1003',0)

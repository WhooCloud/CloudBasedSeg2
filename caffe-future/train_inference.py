import numpy as np
from PIL import Image
import scipy.io
import caffe
import os
import random
import time

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

#def inferrobot(robotid, gpuid):
rootpath = '/home/ubuntu/pynb/caffe-future/train/'
deploypath = rootpath + 'config/deploy.prototxt'
weightspath = rootpath + 'model/_iter_100.caffemodel'

caffe.set_device(0)
caffe.set_mode_gpu()

imagepath = rootpath + 'image.jpg'
outimagepath = rootpath + 'inference.jpg'
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
plt.axis('off')		
plt.subplot(1,2,1)
plt.imshow(image)
mask_carpet = infer == 1
image[mask_carpet] = [255,0,0]


plt.subplot(1,2,2)
plt.imshow(image)
plt.show()
#if __name__ == '__main__':
#    inferrobot('1003',0)
#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Thu Sep 19 20:24:28 2019

@author: bbenneke
"""

from __future__ import division, print_function

import os
import sys
import pandas as pd

from astropy import io
import numpy as np
import matplotlib.pyplot as plt

from scipy.stats import norm


#%%

def model(theta,x,xpos=10):
    A=theta[0]
    B=theta[1]
    m = B * np.ones_like(x) + A * norm.pdf( (x-xpos)/1.0 )
    return m


def prior():
    return


def like():
    return



#%%
    
data = np.array([1837.00283015, 1811.76260793, 1877.0602172 , 1923.04345098,
       1810.09024628, 1898.42037995, 1784.35363285, 1866.72588538,
       1826.22446702, 1896.58934977, 2043.89952533, 1946.20171261,
       1842.25394544, 1803.83175398, 1803.74949885, 1844.61491832,
       1828.0670997 , 1816.13580618, 1885.88536203, 1846.00959492])



#%%
    
l=20
x=np.arange(l)

fig,ax=plt.subplots()
ax.step(x,data,where='mid')
ax.set_xlabel('Pixel')
ax.set_ylabel('Photons Collected')
#ax.set_ylim(bottom=0)



#%%
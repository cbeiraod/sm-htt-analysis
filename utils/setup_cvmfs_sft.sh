#!/bin/bash

LCG_RELEASE=92

if uname -a | grep pauli
then
    source /cvmfs/sft.cern.ch/lcg/views/LCG_${LCG_RELEASE}/x86_64-centos7-gcc7-opt/setup.sh
else
    # Not working for the fermi machines
    source /cvmfs/sft.cern.ch/lcg/views/LCG_${LCG_RELEASE}/x86_64-slc6-gcc7-opt/setup.sh
fi

export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages:$PYTHONPATH

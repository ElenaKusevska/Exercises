#!/bin/bash

array=(*/)

echo $array

#let level=1 # level 1 is the directory where we start. As long as the while
            # is running, and there is what to do, the level will be 1 or
            # greater. When at level 1 it has done everything it will go up
            # by one, and then level become 0. Meaning that the process is
            # over. See illustration for how it works.
#while [ $level ge 1]
#do


#!/usr/local/bin/python
""" EDISON python sample code"""

import sys
import os
import getopt
import math
import numpy as np


try:
    otps, args = getopt.getopt(sys.argv[1:], "i:")
except getopt.GetoptError as err:
    print(str(err))
    sys.exit(1)

for opt, arg in otps:
    if opt in "-i":
        f_inputdeck = open(arg, "r")

print("input file = " + f_inputdeck.name)
inputdeck_lines = f_inputdeck.readlines()

for line in inputdeck_lines:
    opt = line.split()[0]
    if opt in "a":
        a = float(line.split()[1])
        print("init1 : " + str(a))
    elif opt in "b":
        b = float(line.split()[1])
        print("b : " + str(b))
    elif opt in "c":
        c = float(line.split()[1])
        print("c : " + str(c))
    elif opt in "d":
        d = float(line.split()[1])
        print("d : " + str(d))
    else:
        print("Inputdeck value read error. your input key is " + str(opt))
        sys.exit(1)

f_inputdeck.close()

os.system("rm -rf result")
os.system("mkdir result")


f_out = open("result/result.oneD", "w")

times = np.arange(-2.0*math.pi, 2.0*math.pi, 0.1)

f_out.write("#NumField: 1\n")
f_out.write("#LabelX: time, LabelY: a*sine(x+b) \n")
f_out.write("#Field1: a=%f b=%f c=%f d=%f,NumPoint:%i\n" % (a, b, c, d, len(times)))

for time in times:
    y = a*math.sin(b*time-c)+d
    f_out.write("%10.3f     %10.3f\n" % (time, y))

f_out.close()

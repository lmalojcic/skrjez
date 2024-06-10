#!/usr/bin/python3
import sys

file = sys.argv[1]
f = open(file, "r")
lines = f.read().splitlines()
f.close()

i = 0
print("Hyp#Q10#Q20#Q30#Q40#Q50#Q60#Q70#Q80#Q90")
for line in lines:
    list = line.split()
    list_float = [float(x) for x in list]
    list_float.sort()
    Q = [int(len(list) * 0.1), int(len(list) * 0.2), int(len(list) * 0.3), int(len(list) * 0.4), int(len(list) * 0.5), int(len(list) * 0.6), int(len(list) * 0.7), int(len(list) * 0.8), int(len(list) * 0.9)]
    print("{:03d}".format(i), end="#")
    for j in Q:
        print(list_float[j-1], end="#")
    print()
    i += 1
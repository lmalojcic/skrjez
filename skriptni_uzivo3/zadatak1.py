#!/usr/bin/python3
import sys

if len(sys.argv) != 3:
    print("Potrebno je upisati dva argumenta!")
    sys.exit(1)

url = sys.argv[1]
filepath = sys.argv[2]

try:
    f = open(filepath, "r")
    lines = f.read().splitlines()
    f.close()
except FileNotFoundError:
    print("Datoteka ne postoji!")
    sys.exit(1)

results = {}

for line in lines:
    if url in line:
        list = line.split()
        ip = list[0].split(".")
        key = ip[0] + "." + ip[1]
        results[key] = results.get(key, 0) + 1

sorted_results = sorted(results.items(), key=lambda t: t[1], reverse=True)

print("-------------------------------------------")
print("Broj pristupa stranici: " + url)
print("{:>13s} : {:s}".format("IP podmreza", "Broj pristupa"))
print("-------------------------------------------")
for result in sorted_results:
    if result[1] > 1:
        print("{:>13s} : {:d}".format(result[0] + ".*.*", result[1]))
print("-------------------------------------------")
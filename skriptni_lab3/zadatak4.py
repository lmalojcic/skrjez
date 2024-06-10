#!/usr/bin/python3
import sys
import re
import urllib.request
import urllib.parse


url = sys.argv[1]
page = urllib.request.urlopen(url).read().decode('utf-8')

print("Links:")
links = re.findall(r'href=[\'"]?(http[s]{0,1}[^\'" >]+)', page)
for link in links:
    print(link)
print()

print("Hostname\tCount")
hosts_dict = {}
hosts = re.findall(r'href=[\'"]?(http[s]{0,1}[^\'" >]+)', page)
for host in hosts:
    name = urllib.parse.urlparse(host).hostname
    if (name[0:4] =="www."):
        name=name[4:]
    hosts_dict[name] = hosts_dict.get(name, 0) + 1
for key in hosts_dict:
    print(key + "\t" + str(hosts_dict[key]))
print()

print("Emails:")
emails = re.findall(r'([a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+)', page)
for email in emails:
    print(email)
print()

print("Images:")
images = re.findall(r'img.*src="([^"]+)"', page)
for image in images:
    print(image)

#!/usr/bin/python

import sys
import os
import stashy
 
stash = stashy.connect("http://url", "user", "password")

for projects in stash.projects.list():
    print("project name is %s" % projects["key"])
    for repo in stash.projects[projects["key"]].repos.list():
        for url in repo["links"]["clone"]:
            if (url["name"] == "ssh"):
                print("git clone %s" % url["href"])
                os.system("git clone %s" % url["href"])

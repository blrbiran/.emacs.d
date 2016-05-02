# -*- coding: utf-8 -*-
import pyttsx
import sys

engine = pyttsx.init()
engine.setProperty("rate", 140)

def say(data):
    engine.say(data)
    engine.runAndWait()

if(len(sys.argv) < 2):
    coding = "gbk"
else:
    if "utf-8" == sys.argv[1]:
        coding = "utf-8"
    elif "gbk" == sys.argv[1]:
        coding = "gbk"
    else:
        coding = "gbk"

while True:
    text = raw_input().decode(coding)
    say(text)

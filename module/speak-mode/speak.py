# -*- coding: utf-8 -*-
import pyttsx

engine = pyttsx.init()
engine.setProperty("rate", 140)

def say(data):
    engine.say(data)
    engine.runAndWait()

while True:
	say(raw_input())

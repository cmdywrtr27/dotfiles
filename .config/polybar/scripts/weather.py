#!/bin/python
# -*- coding: utf-8 -*-

import requests

CITY = "5308480"
API_KEY = "994f8162aa28ab78c7c441c33654f69d"
UNITS = "Imperial"
#UNIT_KEY = "C"
UNIT_KEY = "F"
LANG = "en"

REQ = requests.get("http://api.openweathermap.org/data/2.5/weather?id={}&lang={}&appid={}&units={}".format(CITY, LANG,  API_KEY, UNITS))
try:
    # HTTP CODE = OK
    if REQ.status_code == 200:
        CURRENT = REQ.json()["weather"][0]["description"].capitalize()
        TEMP = int(float(REQ.json()["main"]["temp"]))
        print("{}, {}°{}".format(CURRENT, TEMP, UNIT_KEY))
    else:
        print("Error: BAD HTTP STATUS CODE " + str(REQ.status_code))
except (ValueError, IOError):
    print("Error: Unable print the data")

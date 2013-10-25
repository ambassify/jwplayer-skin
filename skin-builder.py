#!/usr/bin/python

import base64
import sys
from xml.dom import minidom
import re

basePath = 'src'
skinName = sys.argv[1]
skinPath = basePath + '/' + skinName + '/' + skinName + '.xml'
distPath = 'dist'

try:
	skinFile = open(skinPath,'r')
except IOError:
	print "Skin not found!"
	sys.exit()

skin = minidom.parse(skinFile)
components = skin.getElementsByTagName('component')
for component in components:
        componentName = component.attributes['name']
        elements = component.getElementsByTagName('element')
        for element in elements:
                elementPath = basePath + '/' + skinName + '/' + componentName.value + '/' + element.attributes['src'].value
                imageText = base64.b64encode(open(elementPath,'rb').read())
                element.attributes['src'].value = 'data:image/png;base64,' + imageText
skinText = skin.toxml()
whiteSpace = re.compile('>(.*?)<', re.S)
skinText = whiteSpace.sub('><', skinText)

outputPath = skinPath = distPath + '/' + skinName + '.xml'
outputFile = open(outputPath,'w')
outputFile.write(skinText)
outputFile.close()
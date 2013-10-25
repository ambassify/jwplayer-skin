JWPlayer Skin
=============

This repository contains the files to generate the BuboBox jwplayer skin used.
You can also use this repository to create a custom player skin and use it in your BuboBox account.

Usage
-----
`make clean`: Clean dist folder<br />
`make build`: Create distribution zips, these zips can be uses a skin in jwplayer<br />
`make deploy`: Deploy skin to S3<br />
`make all`: Do all above<br />

Fullscreen
----------
I removed the fullscreen button in the skin by removing the following lines in the elements part of the skin XML:

	<element name="fullscreenButton" src="fullscreenButton.png" />
	<element name="fullscreenButtonOver" src="fullscreenButtonOver.png" />

I removed this because there seem to be some problems with some versions of flash player and fullscreen.

Skin Builder
------------
To use the skin builder you should have a skin folder in the `src` directory that contains a xml file. The folder name and xml file should have the same name. To build the skin you can then use following command:

	./skin-builder.py skinname

This generated skin will be saved in the dist folder.

Todo
----
* Add bubobox-no-brand.xml which will generate a brandless player in the make build step
* Remove non uses elements are use small images to make the resulting builded skin xml smaller

License
-------
(The MIT License)

Copyright (c) 2013 VideoLab nv

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#!/bin/bash -x
#
# This simple script builds the the application for Windows
# using a cross compiler.
#
rm *.exe

git clone https://github.com/ferlzc/qml-demo.git src

# Build the image
docker build -t qt .

# Now extract the generated binary
docker run qt cat release/qml_demo.exe > qml_demo.exe

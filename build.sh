#!/bin/bash

echo "Clean previous deploy"
rm -rf public

echo "Build the website"
hugo build --minify

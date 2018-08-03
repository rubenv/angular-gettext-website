#!/bin/bash

set -ex

dnf -y install nodejs rsync zopfli

npm install
npm build

test -s dist/index.html
test -s dist/css/style.css

rsync -av dist/ ../build/

#!/bin/bash

cd ..
git clone https://github.com/ec-europa/platform-dev.git
cp build.properties.local platform-dev/

cd script
./platform_start.sh
./platform_build.sh
./platform_test.sh

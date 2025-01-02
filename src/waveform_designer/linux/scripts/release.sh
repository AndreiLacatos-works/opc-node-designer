#!/bin/bash

# install dependencies
flutter pub get

# make debian package
flutter_distributor release --name=release --jobs=linux-deb
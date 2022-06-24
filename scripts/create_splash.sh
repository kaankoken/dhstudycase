#!/bin/bash

if hash fvm 2>/dev/null
then
  _flutter="fvm flutter"
else
  _flutter="flutter"
fi

$_flutter pub run flutter_native_splash:create --path=flutter_native_splash.yml

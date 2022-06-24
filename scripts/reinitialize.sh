#!/bin/bash

rm -rf pubspec.lock

if hash fvm 2>/dev/null
then
  _flutter="fvm flutter"
else
  _flutter="flutter"
fi

$_flutter clean
$_flutter pub get
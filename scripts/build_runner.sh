#!/bin/bash

FILE=pubspec.lock
flag=0

if [ ! -f "$FILE" ]
then
  flag=1
fi

_flutter=""

if hash fvm 2>/dev/null
then
  _flutter="fvm flutter"
else
  _flutter="flutter"
fi


if [ "$1" == "1" ]
then
  option=build
else
  option=watch
fi

if [ $flag == 0 ]
then
  rm -rf pubspec.lock
fi

$_flutter pub get
$_flutter pub run build_runner $option --delete-conflicting-outputs

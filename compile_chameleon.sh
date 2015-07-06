#!/bin/bash

echo "Compiling latest Chameleon SVN Source"

echo "Generating folders under /tmp"
mkdir /tmp/chameleon
cd /tmp/chameleon

echo "Getting Source"
svn co http://forge.voodooprojects.org/svn/chameleon/trunk

cd /tmp/chameleon/trunk

echo "Compiling"
make clean && make && make pkg

echo "Moving files to Desktop"
mkdir ~/Desktop/Chameleon-SVN

cp sym/*.pkg ~/Desktop/Chameleon-SVN

s=`(ls ~/Desktop/Chameleon-SVN/*.pkg)`
s=${s##*/}

cp sym/i386/boot ~/Desktop/Chameleon-SVN/${s%.*}-boot

echo "Cleanup"
rm -r /tmp/chameleon

echo "Finish"


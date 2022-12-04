#!/bin/bash

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    echo "[SCS install] OSX: nothing to do";
else
    echo "[SCS install] Linux: installing SCS";
    sudo gem install coveralls-lcov;
    make COV=1 test;    
fi

if [[ $CC = *"gcc"* ]] && [[ $SCS_RUN_PYTHON == 1 ]]; then 
    cd python/; 
    sudo python setup.py install; 
    cd ..;
fi
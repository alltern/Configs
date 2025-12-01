#!/bin/bash

DIR=$1 

APP=$2

mkdir $DIR

mkdir $DIR/cache
mkdir $DIR/config
mkdir $DIR/share

export XDG_CONFIG_HOME=$DIR/config
export XDG_DATA_HOME=$DIR/share
export XDG_CACHE_HOME=$DIR/cache

exec $APP



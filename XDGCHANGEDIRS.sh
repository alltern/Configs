DIR=$1

APP=$2

mkdir $DIR

mkdir $DIR/.cache
mkdir $DIR/.config
mkdir $DIR/.local
mkdir $DIR/.local/share
mkdir $DIR/.local/state
mkdir $DIR/.local/bin

mkdir $DIR/run
mkdir $DIR/run/user
mkdir $DIR/run/user/$UID

mkdir $DIR/usr
mkdir $DIR/usr/local
mkdir $DIR/usr/local/share
mkdir $DIR/usr/share

mkdir $DIR/etc
mkdir $DIR/etc/xdg

export XDG_CONFIG_HOME=$DIR/.config
export XDG_CACHE_HOME=$DIR/.cache
export XDG_DATA_HOME=$DIR/.local/share
export XDG_STATE_HOME=$DIR/.local/state
export XDG_BIN_HOME=$DIR/.local/bin

#Enable the below to also change the non-home directories.

#export XDG_RUNTIME_DIR=$DIR/run/user/$UID
#export XDG_DATA_DIRS='$DIR/usr/local/share:$DIR/usr/share'
#export XDG_CONFIG_DIRS=$DIR/etc/xdg
exec $APP

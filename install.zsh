#!/bin/zsh

###
# Install symlinks to the files in this repo into the current user's $HOME
###

#REPO_DIR=$(pwd);
#DEST_DIR=/tmp/home
REPO_DIR=$(git rev-parse --show-toplevel)
DEST_DIR=$HOME

# Don't link this script or the .git subdirectory
excludes=(
    "\.git.*"
    "install\.zsh"
)
# OR-together the subpatterns
exclude_pattern="\(${(j:\|:)excludes}\)"
#echo EXCLUDE: $exclude_pattern

echo "$REPO_DIR --> $DEST_DIR"
echo "This will install symlinks to all the regular files in this repository into $DEST_DIR"
echo "Any existing files will be backed up, with an underscore prefix."
echo "Afterwards, you probably want to diff any backups to see if there was anything important in them."
echo "Proceed?  (type okeydoke)"
read proceed
[[ $proceed != "okeydoke" ]] && exit 1

for file in $( find $REPO_DIR  -type f | grep -v "$exclude_pattern" );
do;
    #echo sed -e \"s:$REPO_DIR::\"
    relpath=`echo $file | sed -e "s:$REPO_DIR::" `
    linkpath=$DEST_DIR$relpath
    echo "$file --> $linkpath"

    # Make the directory if it doesn't exist.
    if [[ ! -d `dirname $linkpath` ]]; then
       mkdir -p `dirname $linkpath`
    fi

    # if the file already exists, make an underscore-prefixed backup of it
    if [[ -e $linkpath && ! -d $linkpath ]]; then
        echo "FILE EXISTS.  BACKING UP: $linkpath"
        cp $linkpath `dirname $linkpath`/_`basename $linkpath`
    fi

    # if $file is a regular file, create the symlink
    [[ -f $file ]] && ln -f -s $file $linkpath
done;


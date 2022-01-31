
function upsearch_venv() {
    CWD=$PWD
    # search for .venv in all parent dir
    # until root
    while [[ $CWD != "/" ]] ; do
        VENV_PATH=`find $CWD -maxdepth 1 -name .venv`
        if [[ -n "$VENV_PATH" ]] ; then
            echo $VENV_PATH
            return
        fi
        CWD="$(dirname $CWD)"
    done
}

function auto_venv() {
    # if a virtual environment is activate
    # check if you are still under the same virtual environment
    # if not, deactivate
    if [[ -n "$VIRTUAL_ENV" ]] ; then
        parentdir="$(dirname "$VIRTUAL_ENV")"
        if [[ "$PWD"/ != "$parentdir"/* ]] ; then
            deactivate
        fi
    fi
    
    # if under a virtual environment, activate
    if [[ -z "$VIRTUAL_ENV" ]] ; then
        VENV_PATH=`upsearch_venv`
        if [[ -n "$VENV_PATH" ]] ; then
            source $VENV_PATH/bin/activate
        fi
    fi
}

function cd() {
    builtin cd $@
    auto_venv
}

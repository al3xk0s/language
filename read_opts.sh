export MY_OPT_KEY
export MY_OPT_VALUE
export MY_OPT_INDEX
export MY_OPT_KEY_PATTERN="()"

function readOpts._resetEnvs() {
    MY_OPT_KEY=""
    MY_OPT_VALUE=""
    MY_OPT_INDEX=0
}

function readOpts.isKey() {
    local arg="$1"
    if [[ $arg =~ $MY_OPT_KEY_PATTERN ]]; then
        return 0
    fi 
    return 1
}

function readOpts.read() {
    local optScheme="$1"
    
}
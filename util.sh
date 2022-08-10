random.get_string() {
    if [[ -z ${1+x} ]]; then
        echo exist
    fi

    local lenght="$1"
    echo $RANDOM | md5sum | head -c "$lenght"; echo;
}

array.contains() {
    local target="$1"
    local item
    for item in ${@:2}; do
        if [[ "$item" == "$target" ]]; then
            return 0
        fi
    done
    return 1
}

string.split() {
    local oldIFS="$IFS"

    local varName="$1"
    local data="$2"
    local sep="$3"
    
    IFS="$sep" read -ra "$varName" <<< "$data"
    IFS="$oldIFS"
}
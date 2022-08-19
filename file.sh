function file.readLines() {
    local file="$1"
    local outName="$2"
    local out="$outName" && declare -n out
    out=()

    local line
    
    while IFS= read -r line; do
        out[${#out[@]}]="$line"
    done < "$file"
}

# file.writeLines "path/to/file" "${lines[@]}"
# file.writeLines "path/to/file" "first line" "sec line"

function file.writeLines() {
    local file="$1"

    [[ ! -f "$file" ]] && echo > ""

    local item
    for item in "${@:1}"; do
        echo "$item"
    done
}
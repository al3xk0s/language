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

# file.writeLines "${lines[@]}"
# file.writeLines "first line" "sec line"

function file.writeLines() {
    local item
    for item in "${@}"; do
        echo "$item"
    done
}
export IMPORT_SUMS=()

function _containsImport() {
    local targetHash="$1"
    local currentHash
    for currentHash in "${IMPORT_SUMS[@]}"; do
        if [[ "$currentHash" == "$targetHash" ]]; then
            return 0
        fi
    done
    return 1
}

function import() {
    local path="$1"
    local oldPath="$(pwd)"

    local dir="$(dirname "$path")"
    local file="$(basename "$path")"

    local fileHash

    cd "$dir" && \
    fileHash="$(md5sum "$file")" && \
    ! _containsImport "$fileHash" && \
    source "$file" && \
    IMPORT_SUMS[${#IMPORT_SUMS[@]}]="$fileHash"

    cd "$oldPath"
}
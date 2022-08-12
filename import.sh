function @import() {
    local path="$1"
    local old_path="$(pwd)"

    local dir="$(dirname "$path")"
    local file="$(basename "$path")"

    cd "$dir" && \
    source "$file"

    cd "$old_path"
}
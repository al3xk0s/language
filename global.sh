function wrap() {
    local name="$1"
    local target="$3"
    eval "function $target() {
        $name \${@}
    }
    "
}

function like() {
    local value="$1"
    local pattern="($2)"

    if [[ "$value" =~ $pattern ]]; then
        return 0
    fi
    return 1
}
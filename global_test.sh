#!/usr/bin/bash

source "$BASH_LIB/b_unit/b_unit.sh"
source "$BASH_LIB/language/global.sh"

function allias() {
    assertEquals='bUnit.assertEquals'
    assertCode='bUnit.assertCode'
    collectionEquals='bUnit.collectionEquals'
}

classNamePattern="^[A-Z][a-zA-Z0-9]*_[a-zA-Z0-9]+"

test.like.match() {
    local source="DataClass_ksaldkl13409"
    local actual
    local expected="0"

    $(like "$source" "$classNamePattern")
    actual="$?"
    $assertEquals "$expected" "$actual"
}

test.like.doesntMatchLowerInStart() {
    local source="dataClass_ksaldkl13409"
    local actual
    local expected="1"

    $(like "$source" "$classNamePattern")
    actual="$?"
    $assertEquals "$expected" "$actual"
}

test.like.matchInText() {
    local source="str 1 str 2 # target: str 3 str 4"
    local actual
    local expected="0"

    $(like "$source" " # target: ")
    actual="$?"
    $assertEquals "$expected" "$actual"
}

test.like.failedMatchInText() {
    local source="str 1 str 2 # target: str 3 str 4"
    local actual
    local expected="1"

    $(like "$source" " # tardget: ")
    actual="$?"
    $assertEquals "$expected" "$actual"
}

allias
bUnit.runTestGroups
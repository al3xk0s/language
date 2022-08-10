#!/usr/bin/bash

source "$BASH_OPT/b_unit/b_unit.sh"
source "$BASH_OPT/language/global.sh"

function allias() {
    assertEquals='bUnit.assertEquals'
    assertCode='bUnit.assertCode'
    collectionEquals='bUnit.collectionEquals'
}

classNamePattern="^[A-Z][a-zA-Z0-9]*_[a-zA-Z0-9]+"

@test.like.match() {
    local source="DataClass_ksaldkl13409"
    local actual
    local expected="0"

    $(like "$source" "$classNamePattern")
    actual="$?"
    $assertEquals "$expected" "$actual"
}

@test.like.doesntMatchLowerInStart() {
    local source="dataClass_ksaldkl13409"
    local actual
    local expected="1"

    $(like "$source" "$classNamePattern")
    actual="$?"
    $assertEquals "$expected" "$actual"
}

allias
bUnit.runTestGroups
#!/bin/bash
# SPDX-FileCopyrightText: 2026 Toranosuke Hijiya
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目のテスト失敗
    res=1
}

res=0

### NORMAL INPUT ###

out=$(./passcheck Abc12345!)
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = "強い" ] || ng "$LINENO"

out=$(./passcheck abcdefgh)
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = "弱い" ] || ng "$LINENO"

out=$(./passcheck abc12345)
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = "普通" ] || ng "$LINENO"


### STRANGE INPUT ###

out=$(./passcheck)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(./passcheck abc)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(./passcheck abc12345 def67890)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"


[ "${res}" = 0 ] && echo OK
exit $res

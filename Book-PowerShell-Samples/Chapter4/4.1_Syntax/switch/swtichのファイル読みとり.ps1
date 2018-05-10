switch -regex -file swtichのファイル読みとり.ps1 {
    "^switch.*" {
        '1行目'
        continue}
    default { "合致しませんでした" }
}
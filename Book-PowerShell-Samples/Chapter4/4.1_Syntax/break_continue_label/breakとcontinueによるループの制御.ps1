foreach ($a in @(3,4,1,0,6,7,5)){
    # 0 が来たらループ終了
    if ($a -eq 0) { break }
    # 偶数は飛ばす
    if (!($a -band 1)) { continue }
    "$a is odd number"
}

filter yes2 { 
    trap { continue }
    while ($true) { "y" }
}
function head2([int] $count = 10) {
    begin {
        if (0 -ge $count) { break }
    }
    process {
        , $_
        if (0 -ge --$count) { break }
    }
}
yes2 | head2
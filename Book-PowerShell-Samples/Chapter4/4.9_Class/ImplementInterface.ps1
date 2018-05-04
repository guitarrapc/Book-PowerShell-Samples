class Stopwatch : IDisposable {
    [System.Diagnostics.Stopwatch] $_s = [System.Diagnostics.Stopwatch]::new()

    Stopwatch () { $this._s.Start() }

    [void] Dispose() {
        $this._s.Stop()
        [Console]::WriteLine($this._s.Elapsed)
    }
}
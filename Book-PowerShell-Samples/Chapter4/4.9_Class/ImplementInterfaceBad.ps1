class Stopwatch : IDisposable {
    [System.Diagnostics.Stopwatch] $_s = [System.Diagnostics.Stopwatch]::new();
    Stopwatch () { $this._s.Start(); }
}
class OverloadSamples {
    static [String] Hello () {
        return "Hello!"
    }

    static [String] Hello ([String] $Name) {
        return "Hello {0}!" -f $Name
    }

    static [int] Add([int] $a, [int] $b) {
        return $a + $b
    }

    static [double] Add([double] $a, [double] $b) {
        return $a + $b
    }
}
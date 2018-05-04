using namespace System.Management.Automation

[CmdletAttribute('Get', 'Something')]
[Outputtype([String])]
class GetSomethingCommand : PSCmdlet {
    [Parameter()]
    [String]$Parameter
    
    [Void] ProcessRecord() {
        $this.WriteObject('Doing something')
        
        if ($this.Parameter) {
            $this.WriteObject($this.Parameter)
        }
    }
}
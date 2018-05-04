using namespace System.Management.Automation.Runspaces
using namespace System.Reflection

function Import-PSCmdlet {
    param (
        [String]$Name,

        [Type]$Type
    )
    
    $sessionStateCmdletEntry = New-Object SessionStateCmdletEntry(
        $Name,
        $Type,
        $null
    )
    # System.Management.Automation.Runspaces.LocalPipeline will let us get at ExecutionContext.
    # Note: $ExecutionContext is *not* an instance of this object.
    $type = [PowerShell].Assembly.GetType('System.Management.Automation.Runspaces.LocalPipeline')
    $method = $type.GetMethod(
        'GetExecutionContextFromTLS',
        [BindingFlags]'Static,NonPublic'
    )
    # Invoke the method to get an instance of ExecutionContext.
    $context = $method.Invoke(
        $null,
        [BindingFlags]'Static,NonPublic',
        $null,
        $null,
        (Get-Culture)
    )
    # Get the SessionStateInternal type
    $type = [PowerShell].Assembly.GetType('System.Management.Automation.SessionStateInternal')
    # Get a valid constructor which accepts a param of type ExecutionContext
    $constructor = $type.GetConstructor(
        [BindingFlags]'Instance,NonPublic',
        $null,
        $context.GetType(),
        $null
    )
    # Get the SessionStateInternal for this execution context
    $sessionStateInternal = $constructor.Invoke($context)
    # Get the method which allows Cmdlets to be added to the session
    $method = $type.GetMethod(
        'AddSessionStateEntry',
        [BindingFlags]'Instance,NonPublic',
        $null,
        $sessionStateCmdletEntry.GetType(),
        $null
    )
    # Invoke the method.
    $method.Invoke($sessionStateInternal, $sessionStateCmdletEntry)
}
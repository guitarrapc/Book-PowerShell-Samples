using System;
using System.Management.Automation;

namespace StandardModuleSample
{
    [Cmdlet(VerbsCommon.Get, "SampleText")]
    public class GetSampleText : PSCmdlet 
    {
        [Parameter(Mandatory = false, Position = 0, ValueFromPipeline = true)]
        public string Text { get; set; } = "Sample";

        protected override void ProcessRecord()
        {
            WriteObject(this.Text);
        }
    }
}

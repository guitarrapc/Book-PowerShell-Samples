using System;
using System.Threading.Tasks;
using System.Management.Automation;
using System.Net.Http;

namespace StandardModuleSampleAsync
{
    [Cmdlet(VerbsCommunications.Read, "WebSite")]
    [OutputType(typeof(WebSiteResult))]
    public class ReadWebSiteAsync : AsyncPSCmdlet 
    {
        [Parameter(Mandatory = true, Position = 0, ValueFromPipeline = true)]
        public string Url { get; set; }

        private HttpClient client = new HttpClient();

        protected override async Task ProcessRecordAsync()
        {
            var result = await client.GetAsync(this.Url);
            WriteObject(new WebSiteResult(result, await result.Content.ReadAsStringAsync()));
        }
    }

    public class WebSiteResult
    {
        public HttpResponseMessage ResponseMessage { get; }
        public string Content { get; }

        public WebSiteResult(HttpResponseMessage responseMessage, string content)
        {
            this.ResponseMessage = responseMessage;
            this.Content = content;
        }
    }
}

using System;
using System.Management.Automation;
using System.Threading;
using System.Threading.Tasks;

namespace StandardModuleSampleAsync
{
    /// <summary>
    /// Base class for Async PSCmdlet
    /// </summary>
    public abstract class AsyncPSCmdlet : PSCmdlet, IDisposable
    {
        /// <summary>
        /// The source for cancellation tokens that can be used to cancel the operation.
        /// </summary>
        readonly CancellationTokenSource cancellationSource = new CancellationTokenSource();

        /// <summary>
        /// Initialise the <see cref="AsyncPSCmdlet"/>.
        /// </summary>
        protected AsyncPSCmdlet()
        {
        }

        /// <summary>
        /// Finaliser for <see cref="AsyncPSCmdlet"/>.
        /// </summary>
        ~AsyncPSCmdlet()
        {
            Dispose(false);
        }

        /// <summary>
        /// Dispose of resources being used by the Cmdlet.
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// Dispose of resources being used by the Cmdlet.
        /// </summary>
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                cancellationSource.Dispose();
            }
        }

        /// <summary>
        /// Asynchronously perform Cmdlet pre-processing.
        /// </summary>
        protected virtual Task BeginProcessingAsync()
        {
            return BeginProcessingAsync(cancellationSource.Token);
        }

        /// <summary>
        /// Asynchronously perform Cmdlet pre-processing.
        /// </summary>
        protected virtual Task BeginProcessingAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }

        /// <summary>
        /// Asynchronously perform Cmdlet processing.
        /// </summary>
        protected virtual Task ProcessRecordAsync()
        {
            return ProcessRecordAsync(cancellationSource.Token);
        }

        /// <summary>
        /// Asynchronously perform Cmdlet processing.
        /// </summary>
        protected virtual Task ProcessRecordAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }

        /// <summary>
        /// Asynchronously perform Cmdlet post-processing.
        /// </summary>
        protected virtual Task EndProcessingAsync()
        {
            return EndProcessingAsync(cancellationSource.Token);
        }

        /// <summary>
        /// Asynchronously perform Cmdlet post-processing.
        /// </summary>
        protected virtual Task EndProcessingAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }

        protected sealed override void BeginProcessing()
        {
            PowerShellSynchronizationContext.RunSynchronized(() => BeginProcessingAsync());
        }

        protected sealed override void ProcessRecord()
        {
            PowerShellSynchronizationContext.RunSynchronized(() => ProcessRecordAsync());
        }

        protected sealed override void EndProcessing()
        {
            PowerShellSynchronizationContext.RunSynchronized(() => EndProcessingAsync());
        }

        /// <summary>
        /// Interrupt Cmdlet processing (if possible).
        /// </summary>
        protected sealed override void StopProcessing()
        {
            cancellationSource.Cancel();
            base.StopProcessing();
        }

        /// <summary>
        /// Write a progress record to the output stream.
        /// </summary>
        protected void WriteVerboseProgress(ProgressRecord progressRecord)
        {
            if (progressRecord == null) throw new ArgumentNullException(nameof(progressRecord));

            WriteProgress(progressRecord);
            WriteVerbose(progressRecord.StatusDescription);
        }

        /// <summary>
        /// Write a progress record to the output stream.
        /// </summary>
        protected void WriteVerboseProgress(ProgressRecord progressRecord, string messageOrFormat, params object[] formatArguments)
        {
            if (progressRecord == null) throw new ArgumentNullException(nameof(progressRecord));
            if (String.IsNullOrWhiteSpace(messageOrFormat)) throw new ArgumentException("Argument cannot be null, empty, or composed entirely of whitespace: 'messageOrFormat'.", nameof(messageOrFormat));
            if (formatArguments == null) throw new ArgumentNullException(nameof(formatArguments));

            progressRecord.StatusDescription = String.Format(messageOrFormat, formatArguments);
            WriteVerboseProgress(progressRecord);
        }

        /// <summary>
        /// Write a completed progress record to the output stream.
        /// </summary>
        protected void WriteProgressCompletion(ProgressRecord progressRecord, string completionMessageOrFormat, params object[] formatArguments)
        {
            if (progressRecord == null) throw new ArgumentNullException(nameof(progressRecord));
            if (String.IsNullOrWhiteSpace(completionMessageOrFormat)) throw new ArgumentException("Argument cannot be null, empty, or composed entirely of whitespace: 'completionMessageOrFormat'.", nameof(completionMessageOrFormat));
            if (formatArguments == null) throw new ArgumentNullException(nameof(formatArguments));

            progressRecord.StatusDescription = String.Format(completionMessageOrFormat, formatArguments);
            progressRecord.PercentComplete = 100;
            progressRecord.RecordType = ProgressRecordType.Completed;
            WriteProgress(progressRecord);
            WriteVerbose(progressRecord.StatusDescription);
        }
    }
}
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Runtime.ExceptionServices;
using System.Threading;
using System.Threading.Tasks;

namespace StandardModuleSampleAsync
{
    /// <summary>
    /// A synchronisation context that runs all calls scheduled on a single thread.
    /// </summary>
    public sealed class PowerShellSynchronizationContext : SynchronizationContext, IDisposable
    {
        BlockingCollection<KeyValuePair<SendOrPostCallback, object>> workItemQueue = new BlockingCollection<KeyValuePair<SendOrPostCallback, object>>();

        PowerShellSynchronizationContext()
        {
        }

        void IDisposable.Dispose()
        {
            if (workItemQueue != null)
            {
                workItemQueue.Dispose();
                workItemQueue = null;
            }
        }

        void Validate()
        {
            if (workItemQueue == null) throw new ObjectDisposedException(GetType().Name);
        }

        void RunMessage()
        {
            Validate();

            KeyValuePair<SendOrPostCallback, object> workItem;
            while (workItemQueue.TryTake(out workItem, Timeout.InfiniteTimeSpan))
            {
                workItem.Key(workItem.Value);
                if (workItemQueue == null) break;
            }
        }

        void TerminateMessage()
        {
            Validate();
            workItemQueue.CompleteAdding();
        }

        public override void Post(SendOrPostCallback callback, object callbackState)
        {
            if (callback == null) throw new ArgumentNullException(nameof(callback));

            Validate();

            try
            {
                workItemQueue.Add(new KeyValuePair<SendOrPostCallback, object>(callback, callbackState));
            }
            catch (InvalidOperationException ex)
            {
                throw new InvalidOperationException("Cannot enqueue callback, a synchronisationcontext's message has already been terminated.", ex);
            }
        }

        public static void RunSynchronized(Func<Task> asyncOperation)
        {
            if (asyncOperation == null) throw new ArgumentNullException(nameof(asyncOperation));

            SynchronizationContext savedContext = Current;
            try
            {
                using (var synchronizationContext = new PowerShellSynchronizationContext())
                {
                    SetSynchronizationContext(synchronizationContext);

                    var rootOperationTask = asyncOperation();
                    if (rootOperationTask == null) throw new InvalidOperationException("The asynchronous operation delegate cannot return null.");

                    rootOperationTask.ContinueWith(operationTask => synchronizationContext.TerminateMessage(), TaskScheduler.Default);
                    synchronizationContext.RunMessage();

                    try
                    {
                        rootOperationTask.GetAwaiter().GetResult();
                    }
                    catch (AggregateException exs)
                    {
                        AggregateException flattenedAggregate = exs.Flatten();
                        if (flattenedAggregate.InnerExceptions.Count != 1) throw;

                        ExceptionDispatchInfo.Capture(flattenedAggregate.InnerExceptions[0]).Throw();
                    }
                }
            }
            finally
            {
                SetSynchronizationContext(savedContext);
            }
        }

        public static TResult RunSynchronized<TResult>(Func<Task<TResult>> asyncOperation)
        {
            if (asyncOperation == null) throw new ArgumentNullException(nameof(asyncOperation));

            SynchronizationContext savedContext = Current;
            try
            {
                using (var synchronizationContext = new PowerShellSynchronizationContext())
                {
                    SetSynchronizationContext(synchronizationContext);

                    var rootOperationTask = asyncOperation();
                    if (rootOperationTask == null) throw new InvalidOperationException("The asynchronous operation delegate cannot return null.");

                    rootOperationTask.ContinueWith(operationTask => synchronizationContext.TerminateMessage(), TaskScheduler.Default);
                    synchronizationContext.RunMessage();

                    try
                    {
                        return rootOperationTask.GetAwaiter().GetResult();
                    }
                    catch (AggregateException exs)
                    {
                        AggregateException flattenedAggregate = exs.Flatten();
                        if (flattenedAggregate.InnerExceptions.Count != 1) throw;

                        ExceptionDispatchInfo.Capture(flattenedAggregate.InnerExceptions[0]).Throw();
                        throw;
                    }
                }
            }
            finally
            {
                SetSynchronizationContext(savedContext);
            }
        }
    }
}
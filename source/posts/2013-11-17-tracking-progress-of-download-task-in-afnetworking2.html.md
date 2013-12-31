---
layout: post
title: Tracking progress of Download Task in AFNetworking 2
tags: [iOS, afnetworking2]
published: false
---

If you have tried to keep progress of your download tasks with AFNetworking, you would know that things have changed substantially and their is no guide on their github page to achieve this simple task.

```objc
NSURLRequest *request = // create your request;
NSProgress *progress;

NSURLSessionDownloadTask *downloadTask =
  [self.sessionManager downloadTaskWithRequest:request
  progress:&progress destination:^NSURL *(NSURL *targetPath, NSURLResponse *response)
  {
    return //local url path for the file;
  } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error)
  {
    [progress removeObserver:self forKeyPath:PROGRESS_FRACTION_KEY_PATH context:NULL];
    // handle success or failure
  }];

  [progress setUserInfoObject:@"someUniqueID" forKey:DOWNLOAD_KEY];

  [progress addObserver:self
             forKeyPath:PROGRESS_FRACTION_KEY_PATH
                options:NSKeyValueObservingOptionNew
                context:NULL];

  [downloadTask resume];

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([object isKindOfClass:[NSProgress class]] && [keyPath isEqualToString:PROGRESS_FRACTION_KEY_PATH])
    {
        NSProgress *progress = (NSProgress *)object;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"download_progressed" object:progress userInfo:progress.userInfo];
    }
    else
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}
```

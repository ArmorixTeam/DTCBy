# DTCBy
Jailbroken tweak to bypass screenshot &amp; screen recording

This tweak should support iOS 14+ & rootless. Check .deb installation in releases.

# How this works

```UIApplicationUserDidTakeScreenshotNotification``` is a notification posted whenever the user takes a screenshot.

## Screenshot Bypass

```
%hook UIApplication
- (void)userDidTakeScreenshot:(id)arg1 {
    return;  // Do nothing, don't call original implementation
}
%end

```

This blocks the internal iOS method whenever this is called.

## Screen Recording Bypass

```
%hook UIScreen
- (BOOL)isCaptured {
    return NO;  // always return no
}
%end

```

Whenever an application checks if ```UIScreen.main.isCaptured``` is triggered, it will always return NO.

## Notification Intercept

```
- (void)postNotificationName:(NSNotificationName)name object:(id)object {
    if ([name isEqualToString:UIApplicationUserDidTakeScreenshotNotification]) {
        return;  
    }
    %orig; 
}
```

Intercepts all notifications with ```%orig```.

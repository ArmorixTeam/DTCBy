# DTCBy
Jailbroken tweak to bypass screenshot &amp; screen recording

This tweak should support iOS 14+ & rootless. Check .deb installation in releases.

## Pull Requests Open!

I'm too lazy to add specific app support or a preference bundle (and also I keep breaking it somehow, so ultimately I gave up). If you want to contribute (or add) support for it, please make a pull request.

## Installation Details

Grab the latest .deb in releases. Install it with Sileo, Zebra, etc.

Once installed, respring. The tweak should be active and no further action is required.

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

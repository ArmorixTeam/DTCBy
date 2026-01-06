#import <UIKit/UIKit.h>

%hook UIScreen
- (BOOL)isCaptured {
    return NO;
}
%end

%hook UIApplication
- (void)userDidTakeScreenshot:(id)arg1 {
    return;
}
%end

%hook NSNotificationCenter
- (void)postNotificationName:(NSNotificationName)name object:(id)object {
    if ([name isEqualToString:UIApplicationUserDidTakeScreenshotNotification]) {
        return;
    }
    %orig;
}

- (void)postNotificationName:(NSNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo {
    if ([name isEqualToString:UIApplicationUserDidTakeScreenshotNotification]) {
        return;
    }
    %orig;
}
%end

%ctor {
    NSLog(@"[DTCBy] hello there its running and active - zodacios");
}

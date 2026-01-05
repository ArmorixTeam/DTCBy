#import <UIKit/UIKit.h>

#define PLIST_PATH @"/var/jb/var/mobile/Library/Preferences/com.zodacios.dtcby.plist"

static BOOL enabled = YES;

static void loadPreferences() {
    NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH];
    if (prefs) {
        enabled = [prefs[@"enabled"] boolValue];
    }
}

%hook UIScreen
- (BOOL)isCaptured {
    if (!enabled) return %orig;
    return NO;
}
%end

%hook UIApplication
- (void)userDidTakeScreenshot:(id)arg1 {
    if (!enabled) {
        %orig;
        return;
    }
    return;
}
%end

%hook NSNotificationCenter
- (void)postNotificationName:(NSNotificationName)name object:(id)object {
    if (enabled && [name isEqualToString:UIApplicationUserDidTakeScreenshotNotification]) {
        return;
    }
    %orig;
}

- (void)postNotificationName:(NSNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo {
    if (enabled && [name isEqualToString:UIApplicationUserDidTakeScreenshotNotification]) {
        return;
    }
    %orig;
}
%end

%ctor {
    loadPreferences();
    CFNotificationCenterAddObserver(
        CFNotificationCenterGetDarwinNotifyCenter(),
        NULL,
        (CFNotificationCallback)loadPreferences,
        CFSTR("com.zodacios.dtcby/ReloadPrefs"),
        NULL,
        CFNotificationSuspensionBehaviorCoalesce
    );
    NSLog(@"[DTCBy] Tweak loaded - Enabled: %d", enabled);
}

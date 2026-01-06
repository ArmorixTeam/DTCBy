#import <UIKit/UIKit.h>
#import <CepheiPrefs/HBRootListController.h>
#import <spawn.h>

@interface DTCByRootListController : HBRootListController
@end

@implementation DTCByRootListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
    }
    return _specifiers;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.tintColor = [UIColor colorWithRed:0.1 green:0.5 blue:1.0 alpha:1.0];
    if (self.navigationController) {
        self.navigationController.navigationBar.tintColor =
            [UIColor colorWithRed:0.1 green:0.5 blue:1.0 alpha:1.0];
    }
}

- (void)openGitHub {
    NSURL *url = [NSURL URLWithString:@"https://github.com/ZodaciOS"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

- (void)respring {
    pid_t pid;
    const char *args[] = {"/var/jb/usr/bin/sbreload", NULL};
    posix_spawn(&pid, args[0], NULL, NULL, (char *const *)args, NULL);
}

@end

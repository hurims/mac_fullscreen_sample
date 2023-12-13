//
//  AppDelegate.m
//  my_xcode
//
//  Created by USER on 12/13/23.
//

#import "AppDelegate.h"

@implementation AppDelegate {
    BOOL isFullScreen;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
//    // Insert code here to initialize your application
//    NSApplicationPresentationOptions options = NSApplicationPresentationHideDock | NSApplicationPresentationHideMenuBar | NSApplicationPresentationDisableProcessSwitching;
//    options |= NSApplicationPresentationDisableSessionTermination | NSApplicationPresentationDisableForceQuit;
//    options |= NSApplicationPresentationFullScreen;
//    [NSApp setPresentationOptions:options];
//    
//    NSApplicationPresentationOptions result = [NSApp presentationOptions];
    
    
//    NSApplicationPresentationOptions options =
//        NSApp.currentSystemPresentationOptions;

    
//    // Make the main window fullscreen
//    [self.window setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];
//    [self.window toggleFullScreen:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (void)applicationWillBecomeActive:(NSNotification *)notification {
    // Monitor left mouse down events directly.
    [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskLeftMouseDown
                                          handler:^NSEvent * _Nullable(NSEvent * _Nonnull event) {
        [self handleMouseClick:event];
        return event;
    }];
}

- (void)handleMouseClick:(NSEvent *)event {
    // This method will be called when the left mouse button is clicked
    
    if (isFullScreen) {
        [NSApp setPresentationOptions:NSApplicationPresentationDefault];
        NSLog(@"Back to normal screen");
    } else {
        NSApplicationPresentationOptions options = NSApplicationPresentationHideDock | NSApplicationPresentationHideMenuBar | NSApplicationPresentationDisableProcessSwitching;
        options |= NSApplicationPresentationDisableSessionTermination | NSApplicationPresentationDisableForceQuit;
    //    options |= NSApplicationPresentationFullScreen;
        [NSApp setPresentationOptions:options];
        NSLog(@"Go to full screen");
    }
    
    // Update the fullscreen state for the next click.
    isFullScreen = !isFullScreen;

    NSApplicationPresentationOptions result = [NSApp presentationOptions];
}


@end

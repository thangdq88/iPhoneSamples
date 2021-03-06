//
//  TestThree20AppDelegate.m
//  TestThree20
//
//  Created by Kosuke Matsuda on 11/08/31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestThree20AppDelegate.h"

#import "MenuViewController.h"
#import "FeedViewController.h"
#import "PhotoViewController.h"
#import "GroupViewController.h"
#import "MemberViewController.h"
#import "InviteViewController.h"
#import "SearchViewController.h"
#import "NoticeViewController.h"
#import "ConfigViewController.h"

@implementation TestThree20AppDelegate


@synthesize window=_window;

@synthesize navigationController = navigationController_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    TTNavigator* navigator = [TTNavigator navigator];
    navigator.persistenceMode = TTNavigatorPersistenceModeNone;
//    navigator.persistenceMode = TTNavigatorPersistenceModeTop;
//    navigator.persistenceMode = TTNavigatorPersistenceModeAll;
//    navigator.window = [[[UIWindow alloc] initWithFrame:TTScreenBounds()] autorelease];

    self.window.rootViewController = self.navigationController;
    [self.window addSubview:self.navigationController.view];
    [self.window makeKeyAndVisible];

    TTURLMap* map = navigator.URLMap;
    [map from:@"*" toViewController:[TTWebController class]];
    [map from:zAppMenuURLPath toSharedViewController:[MenuViewController class]];
    [map from:zAppFeedURLPath toViewController:[FeedViewController class]];
    [map from:zAppPhotoURLPath toViewController:[PhotoViewController class]];
    [map from:zAppGroupURLPath toViewController:[GroupViewController class]];
    [map from:zAppMemberURLPath toViewController:[MemberViewController class]];
    [map from:zAppInviteURLPath toViewController:[InviteViewController class]];
    [map from:zAppSearchURLPath toViewController:[SearchViewController class]];
    [map from:zAppNoticeURLPath toModalViewController:[NoticeViewController class]];
    [map from:zAppConfigURLPath toModalViewController:[ConfigViewController class]];

    if (![navigator restoreViewControllers]) {
        // This is the first launch, so we just start with the tab bar
        [navigator openURLAction:[TTURLAction actionWithURLPath:zAppMenuURLPath]];
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [navigationController_ release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSLog(@"sssssssssssssssssssss");
    [[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:url.absoluteString]];
    return YES;
}
@end

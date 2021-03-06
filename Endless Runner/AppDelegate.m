//
//  AppDelegate.m
//  Endless Runner
//
//  Created by acp14stt on 25/11/2014.
//  Copyright (c) 2014 sheffield. All rights reserved.
//

#import "AppDelegate.h"
#import "MainMenuViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
 
    // Override point for customization after application launch.
    NSString *filepath = [[NSBundle mainBundle]
                          pathForResource:@"LennyHighScores" ofType:@"plist"];
    self.highscores = [[NSArray alloc]                    initWithContentsOfFile:filepath];
    //Delete documents folder contents
    /*NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *documentsDirectory = [paths objectAtIndex:0];
     NSFileManager *fileMgr = [[NSFileManager alloc] init];
     NSError *error = nil;
     [fileMgr removeItemAtPath:documentsDirectory error:&error];*/
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    //Whenever app is sent to background highscores are saved to plist
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    [self.highscores writeToFile:[documentsDirectory stringByAppendingPathComponent:@"LennyHighScores.plist"] atomically:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    //When ever app becomes active highscores is reset and then pulled from the Plist
    self.highscores = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filepath = [documentsDirectory stringByAppendingPathComponent:@"LennyHighScores.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filepath])
    {
        filepath = [[NSBundle mainBundle] pathForResource:@"LennyHighScores" ofType:@"plist"];
    }
    self.highscores = [[NSArray alloc]                    initWithContentsOfFile:filepath];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    //Saves highscores when the application is about to terminate, note: this doesn't save if the app is terminated by restarting or abruptly stopping the debugger for some reason
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    [self.highscores writeToFile:[documentsDirectory stringByAppendingPathComponent:@"LennyHighScores.plist"] atomically:YES];
}

@end

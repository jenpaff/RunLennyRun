//
//  AppDelegate.h
//  Endless Runner
//
//  Created by acp14stt on 25/11/2014.
//  Copyright (c) 2014 sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

//>>>>>>>>>>>>>>>>>>>>PROPERTIES<<<<<<<<<<<<<<<<<<<<
@property (strong, nonatomic) UIWindow *window;

//Used to store/retrieve high scores in the local session from anywhere in the app
@property (strong, nonatomic) NSArray* highscores;
@end


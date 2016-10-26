//
//  AppDelegate.m
//  MBProgress-Demo
//
//  Created by 王潇 on 16/10/25.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	ViewController *viewController = [[ViewController alloc] init];
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
	self.window.rootViewController = navController;
	[self.window makeKeyAndVisible];
	
	return YES;
}


@end

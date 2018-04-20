//
//  AppDelegate.m
//  NotoficationDemo
//
//  Created by 刘伟哲 on 2018/4/20.
//  Copyright © 2018年 刘伟哲. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    [self.window makeKeyAndVisible];

    //当程序没有在后台和前台运行时，在收到推送会在这里处理
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
    label.backgroundColor = [UIColor brownColor];
    label.textColor = [UIColor blackColor];
    label.tag = 100;
    [self.window addSubview:label];

    NSDictionary * dict = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if(dict){
        label.backgroundColor = [UIColor purpleColor];
        label.text = dict[@"aps"][@"alert"];
    }
    
    [application registerForRemoteNotifications];
    return YES;
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSLog(@"%@",deviceToken);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"%@",error.description);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    NSLog(@"%@",userInfo);
    
    //程序在前台和推到后台收到的推送
    UILabel * label = (UILabel *)[self.window viewWithTag:100];
    label.text = [[userInfo objectForKey:@"aps"] objectForKey:@"other"];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    [application setApplicationIconBadgeNumber:0];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}



@end

//
//  AppDelegate.m
//  joker
//
//  Created by scjy on 16/3/3.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import "AppDelegate.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
//qq和qq空间
#import <TencentOpenAPI/TencentOAuth.h>

#import <TencentOpenAPI/QQApiInterface.h>
//微信
#import <WXApi.h>
//新浪微博
#import <WeiboSDK.h>

#import <BmobSDK/Bmob.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //bmob
     [Bmob registerWithAppKey:@"d1399be6ba1403fd5ff25b266c685c5d"];
    
    
    
    //shareSDK
    [ShareSDK registerApp:@"iosv1101"
     
          activePlatforms:@[
                            @(SSDKPlatformTypeSinaWeibo),
                            @(SSDKPlatformTypeMail),
                            @(SSDKPlatformTypeSMS),
                            @(SSDKPlatformTypeCopy),
                            @(SSDKPlatformTypeWechat),
                            @(SSDKPlatformTypeQQ),
                            @(SSDKPlatformTypeRenren),
                            @(SSDKPlatformTypeGooglePlus)]
                 onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
 
             default:
                 break;
         }
     }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         
         switch (platformType)
         {
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:@"568898243"
                    appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                    redirectUri:@"http://www.sharesdk.cn"
                        authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
            appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                 break;
             case SSDKPlatformTypeQQ:
    [appInfo SSDKSetupQQByAppId:@"100371282"
    appKey:@"aed9b0303e3ed1e27bae87c33761161d"
        authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeRenren:
                 [appInfo  SSDKSetupRenRenByAppId:@"226427"
                appKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
                secretKey:@"f29df781abdd4f49beca5a2194676ca4"
                    authType:SSDKAuthTypeBoth];
                 break;

             default:
                 break;
         }
     }];





    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];

    //首页
    UIStoryboard *firstStoryBoard = [UIStoryboard storyboardWithName:@"First" bundle:nil];
    UINavigationController *firstNav = [firstStoryBoard instantiateInitialViewController];
    firstNav.tabBarItem.image = [UIImage imageNamed:@"ft_home_normal_ic"];
    firstNav.tabBarItem.selectedImage = [UIImage imageNamed:@"ft_home_selected_ic"];
    firstNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    //审查
    UIStoryboard *checkStoryBoard = [UIStoryboard storyboardWithName:@"Check" bundle:nil];
    UINavigationController *checkNav = [checkStoryBoard instantiateInitialViewController];
    checkNav.tabBarItem.image = [UIImage imageNamed:@"ft_person_normal_ic"];
    checkNav.tabBarItem.selectedImage = [UIImage imageNamed:@"ft_person_normal_ic"];
    checkNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    //发现
    UIStoryboard *discoverStoryBoard = [UIStoryboard storyboardWithName:@"Discover" bundle:nil];
    UINavigationController *disNav = [discoverStoryBoard instantiateInitialViewController];
    disNav.tabBarItem.image = [UIImage imageNamed:@"ft_found_normal_ic"];
    disNav.tabBarItem.selectedImage = [UIImage imageNamed:@"ft_found_selected_ic"];
   disNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    //信息
    UIStoryboard *messageStoryBoard = [UIStoryboard storyboardWithName:@"Message" bundle:nil];
    UINavigationController *messageNav = [messageStoryBoard instantiateInitialViewController];
    messageNav.tabBarItem.image = [UIImage imageNamed:@"chat"];
    messageNav.tabBarItem.selectedImage = [UIImage imageNamed:@"chat2"];
    messageNav.tabBarItem.title = @"信息";
    messageNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    //添加被管理的视图控制器
    tabBarVC.viewControllers = @[firstNav, checkNav, disNav, messageNav];
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

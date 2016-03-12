//
//  LoginViewController.h
//  joker
//
//  Created by scjy on 16/3/11.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol getUserName <NSObject>

- (void)getUserName:(NSString *)name;

@end

@interface LoginViewController : UIViewController
@property(nonatomic, assign) id<getUserName>delegate;
@end

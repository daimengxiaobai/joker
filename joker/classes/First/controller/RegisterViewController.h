//
//  RegisterViewController.h
//  joker
//
//  Created by scjy on 16/3/11.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol getPassWord <NSObject>

- (void)getName:(NSString *)name andCount:(NSString *)count andPassWord:(NSString *)passWord;

@end

@interface RegisterViewController : UIViewController

@property(nonatomic, assign) id<getPassWord>delegate;

@end

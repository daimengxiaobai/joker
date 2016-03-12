//
//  LoginViewController.m
//  joker
//
//  Created by scjy on 16/3/11.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Login";
    
    [self.GoButton addTarget:self action:@selector(goRegister:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)goRegister:(UIButton *)btn{
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"First" bundle:nil];
    RegisterViewController *registerVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"registerVC"];
    [self.navigationController pushViewController:registerVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

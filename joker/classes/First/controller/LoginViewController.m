//
//  LoginViewController.m
//  joker
//
//  Created by scjy on 16/3/11.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import <BmobSDK/BmobUser.h>

@interface LoginViewController ()<getPassWord>

@property (weak, nonatomic) IBOutlet UITextField *ZhangHao;
@property (weak, nonatomic) IBOutlet UITextField *MiMa;
@property (weak, nonatomic) NSString *name;

@property (weak, nonatomic) IBOutlet UIButton *goRegister;

@property (weak, nonatomic) IBOutlet UIButton *goLogin;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Login";
    
    [self.goRegister addTarget:self action:@selector(goRegister:) forControlEvents:UIControlEventTouchUpInside];
    [self.goLogin addTarget:self action:@selector(goLogin:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)goRegister:(UIButton *)btn{
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"First" bundle:nil];
    RegisterViewController *registerVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"registerVC"];
    registerVC.delegate = self;
    [self.navigationController pushViewController:registerVC animated:YES];
}
- (void)goLogin:(UIButton *)btn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(getUserName:)]) {
        [self.delegate getUserName:self.name];
    }
    [BmobUser loginWithUsernameInBackground:self.ZhangHao.text password:self.MiMa.text];
      [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //这个是逐个的textFiled回收键盘，比较麻烦
  //  [self.ZhangHao resignFirstResponder];
  //  [self.MiMa resignFirstResponder];
    //view结束编辑，回收键盘
    [self.view endEditing:YES];
}
- (void)getName:(NSString *)name andCount:(NSString *)count andPassWord:(NSString *)passWord{
    self.name = name;
    self.ZhangHao.text = count;
    self.MiMa.text = passWord;
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

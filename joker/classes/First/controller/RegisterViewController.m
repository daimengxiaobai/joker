//
//  RegisterViewController.m
//  joker
//
//  Created by scjy on 16/3/11.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"
#import <BmobSDK/BmobUser.h>
#import "ProgressHUD.h"
@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *ZhangHao;
@property (weak, nonatomic) IBOutlet UITextField *MiMa;
@property (weak, nonatomic) IBOutlet UITextField *affirmMiMa;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Register";
    [self.registerButton addTarget:self action:@selector(backLogin:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)backLogin:(UIButton *)btn{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(getName:andCount:andPassWord:)]) {
        [self.delegate getName:self.name.text andCount:self.ZhangHao.text andPassWord:self.MiMa.text];
    }

    if (![self checkout]) {
        return;
    }
        BmobUser *bUser = [[BmobUser alloc] init];
        [bUser setUsername:@"小明"];
        [bUser setPassword:self.MiMa.text];
        [bUser setEmail:self.ZhangHao.text];
        [bUser signUpInBackgroundWithBlock:^ (BOOL isSuccessful, NSError *error){
            if (isSuccessful){
                BmobUser *user = [BmobUser getCurrentUser];
                //应用开启了邮箱验证功能
                if ([user objectForKey:@"emailVerified"]) {
                    //应用没验证过邮箱
                    if (![[user objectForKey:@"emailVerified"] boolValue]) {
                        [user verifyEmailInBackgroundWithEmailAddress:self.ZhangHao.text];
                        [ProgressHUD showSuccess:@"注册成功"];
                    }
                }
                NSLog(@"注册成功");
            } else {
                NSLog(@"注册失败");
                NSLog(@"%@", error);
            }
        }];
        
        [self.navigationController popViewControllerAnimated:YES];
    }


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (BOOL)checkout{
    //用户名不能为空且不能为空格
    if (self.name.text.length > 0 && [self.name.text stringByReplacingOccurrencesOfString:@" " withString:@""].length > 0 && self.MiMa.text.length > 0) {
        //两次输入密码一致
        if ([self.MiMa.text isEqualToString:self.affirmMiMa.text]) {
            
        }else{
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"用户提示" message:@"两次输入的密码不一致" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            } ];
            [alertController addAction:action];
            [self.navigationController presentViewController:alertController animated:YES completion:nil];
            return NO;
        }
        
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"用户提示" message:@"用户名无效" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        } ];
        [alertController addAction:action];
        [self.navigationController presentViewController:alertController animated:YES completion:nil];
        return NO;
    }
    return [self validateEmail:self.ZhangHao.text];
    
}

- (BOOL)validateEmail:(NSString *)email{
    //判断是否是邮箱
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
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

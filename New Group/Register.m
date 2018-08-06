//
//  Register.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/3.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "Register.h"
#import "Login.h"

@interface Register ()

@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView * back = [UIImageView new];
    back.frame = self.view.frame;
    back.image = [UIImage imageNamed:@"kaiji1"];
    [self.view addSubview:back];
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(100, 440, 80, 30);
    [btn1 setTitle:@"返回登录" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn1 addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    //允许边界超出
    [btn1.layer setMasksToBounds:YES];
    //半径
    [btn1.layer setCornerRadius:15];
    //宽度
    [btn1.layer setBorderWidth:1];
    //边框颜色
    [btn1.layer setBorderColor:[UIColor whiteColor].CGColor];
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(200, 440, 80, 30);
    
    [btn2 setTitle:@"点击注册" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn2 addTarget:self action:@selector(showRegister:) forControlEvents:UIControlEventTouchUpInside];
    //允许边界超出
    [btn2.layer setMasksToBounds:YES];
    //半径
    [btn2.layer setCornerRadius:15];
    //宽度
    [btn2.layer setBorderWidth:1];
    //边框颜色
    [btn2.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    
    UILabel * label = [UILabel new];
    label.frame = CGRectMake(150, 200, 120, 120);
    label.text = @"SHARE";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:35];
    [self.view addSubview:label];
    
    _userName = [UITextField new];
    _password = [UITextField new];
    _userName.frame = CGRectMake(40, 300, 340, 40);
    _userName.borderStyle = UITextBorderStyleRoundedRect;
    _userName.backgroundColor = [UIColor whiteColor];
    UIImageView * username = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    username.image = [UIImage imageNamed:@"3"];
    _userName.leftView = username;
    _userName.leftViewMode = UITextFieldViewModeAlways;
    _password.frame = CGRectMake(40, 350, 340, 40);
    _password.borderStyle = UITextBorderStyleRoundedRect;
    _password.backgroundColor = [UIColor whiteColor];
    _password.secureTextEntry = YES;
    UIImageView * passimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    passimage.image = [UIImage imageNamed:@"4"];
    _password.leftView = passimage;
    _password.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_userName];
    [self.view addSubview:_password];
    
    UIImageView * logo = [UIImageView new];
    logo.frame = CGRectMake(150, 130, 110, 110);
    logo.image = [UIImage imageNamed:@"login_logo.png"];
    [self.view addSubview:logo];
    
}


- (IBAction)showLogin:(UIButton *)sender {
    //显示提示框
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"登录" message:@"登录已成功！" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"成功" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction: defaultAction];
    [self presentViewController: alert animated: YES completion:nil];
}


- (IBAction)showRegister:(UIButton *)sender {
    //显示提示框
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"注册" message:@"注册一个share账号" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"注册成功" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction: defaultAction];
    [self presentViewController: alert animated: YES completion:nil];
}

- (void)click
{
    Login * a = [Login new];
    a.na = _userName.text;
    a.pa = _password.text;
    [self presentViewController:a animated:YES completion:nil];
}

//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.textName resignFirstResponder];
    //[self.textSummary resignFirstResponder];
    [self.view endEditing:YES];
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

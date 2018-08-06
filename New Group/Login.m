//
//  Login.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/27.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "Login.h"
#import "AppDelegate.h"
#import "VCFirst.h"
#import "VCSecond.h"
#import "VCThird.h"
#import "VCFouth.h"
#import "VCFifth.h"
#import "upload_image.h"
#import "Register.h"

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView * back = [UIImageView new];
    back.frame = self.view.frame;
    back.image = [UIImage imageNamed:@"kaiji1"];
    [self.view addSubview:back];
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(100, 440, 80, 30);
    [btn1 setTitle:@"登录" forState:UIControlStateNormal];
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
    
    [btn2 setTitle:@"注册" forState:UIControlStateNormal];
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
    
    UITextField * userName = [UITextField new];
    userName.text = _na;
    UITextField * password = [UITextField new];
    password.text = _pa;
    userName.frame = CGRectMake(40, 300, 340, 40);
    userName.borderStyle = UITextBorderStyleRoundedRect;
    userName.backgroundColor = [UIColor whiteColor];
    UIImageView * username = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    username.image = [UIImage imageNamed:@"3"];
    userName.leftView = username;
    userName.leftViewMode = UITextFieldViewModeAlways;
    password.frame = CGRectMake(40, 350, 340, 40);
    password.borderStyle = UITextBorderStyleRoundedRect;
    password.backgroundColor = [UIColor whiteColor];
    password.secureTextEntry = YES;
    UIImageView * passimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    passimage.image = [UIImage imageNamed:@"4"];
    password.leftView = passimage;
    password.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:userName];
    [self.view addSubview:password];
    
    UIImageView * logo = [UIImageView new];
    logo.frame = CGRectMake(150, 130, 110, 110);
    logo.image = [UIImage imageNamed:@"login_logo.png"];
    [self.view addSubview:logo];
    
}

-(void)click
{
    _tbController = [UITabBarController new];
    //添加视图
    VCFirst * vcFirst = [VCFirst new];
    vcFirst.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    VCSecond * vcSecond = [VCSecond new];
    vcSecond.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    VCThird * vcThird = [VCThird new];
    vcThird.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    VCFouth * vcFouth = [VCFouth new];
    vcFouth.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    VCFifth * vcFifth = [VCFifth new];
    vcFifth.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    
    
    //分栏元素的设置
    UITabBarItem * tabBarItem1 = [UITabBarItem new];
    tabBarItem1.selectedImage = [[UIImage imageNamed:@"radio_button1_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem1.image = [[UIImage imageNamed:@"radio_button1_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:vcFirst];
    vcFirst.title = @"SHARE";
    nav1.navigationBar.barTintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [nav1.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //nav1.navigationBar.tintColor = [UIColor redColor];
    
    
    UITabBarItem * tabBarItem2 = [UITabBarItem new];
    tabBarItem2.selectedImage = [[UIImage imageNamed:@"search_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.image = [[UIImage imageNamed:@"search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:vcSecond];
    vcSecond.title = @"搜索";
    nav2.navigationBar.barTintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [nav2.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UITabBarItem * tabBarItem3 = [UITabBarItem new];
    tabBarItem3.selectedImage = [[UIImage imageNamed:@"xiugai_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem3.image = [[UIImage imageNamed:@"xiugai"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:vcThird];
    vcThird.title = @"文章";
    nav3.navigationBar.barTintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [nav3.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UITabBarItem * tabBarItem4 = [UITabBarItem new];
    tabBarItem4.selectedImage = [[UIImage imageNamed:@"jiangbei_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem4.image = [[UIImage imageNamed:@"jiangbei"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav4 = [[UINavigationController alloc] initWithRootViewController:vcFouth];
    vcFouth.title = @"活动";
    nav4.navigationBar.barTintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [nav4.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UITabBarItem * tabBarItem5 = [UITabBarItem new];
    tabBarItem5.selectedImage = [[UIImage imageNamed:@"touxiang_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem5.image = [[UIImage imageNamed:@"touxiang"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav5 = [[UINavigationController alloc] initWithRootViewController:vcFifth];
    vcFifth.title = @"个人信息";
    nav5.navigationBar.barTintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [nav5.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    vcFirst.tabBarItem = tabBarItem1;
    vcSecond.tabBarItem = tabBarItem2;
    vcThird.tabBarItem = tabBarItem3;
    vcFouth.tabBarItem = tabBarItem4;
    vcFifth.tabBarItem = tabBarItem5;
    
    
    //分栏的添加
    _pageTable = [NSArray arrayWithObjects:nav1, nav2, nav3, nav4, nav5, nil];
    _tbController.viewControllers = _pageTable;
    [self presentViewController:_tbController animated:YES completion:nil];
}

- (IBAction)showLogin:(UIButton *)sender {
    //显示提示框
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"登录" message:@"登录已成功！" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"成功" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction: defaultAction];
    [self presentViewController: alert animated: YES completion:nil];
}


- (IBAction)showRegister:(UIButton *)sender {
    Register * a = [Register new];
    [self presentViewController: a animated: YES completion:nil];
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

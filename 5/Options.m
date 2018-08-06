//
//  Options.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/31.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "Options.h"
#import "Options_recommend.h"
#import "options_information.h"
#import "options_basic_information.h"
#import "options_changePassword.h"

@interface Options ()

@end

@implementation Options

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    
    _option = [NSArray arrayWithObjects:@"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        UIImageView * imag = [[UIImageView alloc] initWithFrame:CGRectMake(370, 15, 20, 20)];
        imag.image = [UIImage imageNamed:@"img3"];
        [cell.contentView addSubview:imag];
    }
    cell.textLabel.text = _option[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0 && indexPath.row == 4) {
        //显示提示框
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"缓存已清除" message:@" " preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction: defaultAction];
        
        [self presentViewController: alert animated: YES completion:nil];
    }
    options_information * a = [options_information new];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(click:)];
    a.navigationItem.leftBarButtonItem = item;
    a.navigationItem.backBarButtonItem = item;
    a.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    if (indexPath.row == 2) {
        self.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:a animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    options_basic_information * b = [options_basic_information new];
    b.navigationItem.leftBarButtonItem = item;
    b.navigationItem.backBarButtonItem = item;
    b.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    if (indexPath.row == 0) {
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:b animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    options_changePassword * c = [options_changePassword new];
    c.navigationItem.leftBarButtonItem = item;
    c.navigationItem.backBarButtonItem = item;
    c.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    if (indexPath.row == 1) {
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:c animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
}

- (void)click:(UINavigationController *) a
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
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

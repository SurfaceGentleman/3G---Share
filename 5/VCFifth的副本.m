//
//  VCFifth.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/27.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "VCFifth.h"
#import "Options.h"
#import "Options_recommend.h"
#import "my_message.h"
#import "upload.h"

@interface VCFifth ()

@end

@implementation VCFifth

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.sectionHeaderHeight = 0;
    _tableView.sectionFooterHeight = 15;
    [self.view addSubview:_tableView];
    
    _message = [NSArray arrayWithObjects:@"我上传的", @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出", @" ", nil];
    _icon = [NSArray arrayWithObjects:@"5-1", @"5-3", @"5-2", @"5-4", @"5-5", @"5-6", @" ",  nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 1;
    }
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell1 = [tableView dequeueReusableCellWithIdentifier:@"ID1"];
    UITableViewCell * cell2 = [tableView dequeueReusableCellWithIdentifier:@"ID2"];
    if (indexPath.section == 0) {
        if(cell1 == nil){
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID1"];
            UILabel * name = [UILabel new];
            name.frame = CGRectMake(150, 30, 180, 40);
            name.text = @"share小白";
            name.font = [UIFont systemFontOfSize:20];
            UILabel * detail = [UILabel new];
            detail.frame = CGRectMake(150, 60, 150, 25);
            detail.text = @"数媒/设计爱好者";
            detail.font = [UIFont systemFontOfSize:13];
            UILabel * signature = [UILabel new];
            signature.frame = CGRectMake(150, 100, 280, 25);
            signature.text = @"开心了就笑，不开心了过会儿再笑";
            signature.font = [UIFont systemFontOfSize:15];
            [cell1.contentView addSubview:name];
            [cell1.contentView addSubview:detail];
            [cell1.contentView addSubview:signature];
            
            //设置头像
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 35, 100, 100)];
            imageView.image = [UIImage imageNamed:@"works_head"];
            [cell1.contentView addSubview:imageView];
        }
        cell1.textLabel.text = nil;
        return cell1;
    }
    else{
        if(cell2 == nil) {
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID2"];
            UIImageView * imag = [[UIImageView alloc] initWithFrame:CGRectMake(370, 15, 20, 20)];
            imag.image = [UIImage imageNamed:@"img3"];
            [cell2.contentView addSubview:imag];
        }
        cell2.textLabel.text = _message[indexPath.row];
        cell2.imageView.image = [UIImage imageNamed:_icon[indexPath.row]];
        
        return cell2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 160;
    }
        return 60;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Options * a = [Options new];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(click:)];
    a.navigationItem.leftBarButtonItem = item;
    a.navigationItem.backBarButtonItem = item;
    a.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    a.view.backgroundColor = [UIColor whiteColor];
    if (indexPath.row == 4 && indexPath.section == 1) {
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:a animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    Options_recommend * b = [Options_recommend new];
    b.navigationItem.leftBarButtonItem = item;
    b.navigationItem.backBarButtonItem = item;
    b.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    if (indexPath.section == 1 && indexPath.row == 2) {
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:b animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    my_message * c = [my_message new];
    c.navigationItem.leftBarButtonItem = item;
    c.navigationItem.backBarButtonItem = item;
    c.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    if (indexPath.section == 1 && indexPath.row == 1) {
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:c animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    upload * d = [upload new];
    d.navigationItem.leftBarButtonItem = item;
    d.navigationItem.backBarButtonItem = item;
    d.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    if (indexPath.section == 1 && indexPath.row == 0) {
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:d animated:YES];
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

//
//  my_message_newfollowers.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/1.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "my_message_newfollowers.h"

@interface my_message_newfollowers ()

@end

@implementation my_message_newfollowers

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _name = [NSArray arrayWithObjects:@"share小格", @"share小兰", @"share小明", @"share小雪", @"share萌萌", @"shareLity", nil];
    _ima = [NSArray arrayWithObjects:@"sixin_img1", @"sixin_img2", @"sixin_img3", @"sixin_img4", @"guanzhu_img5", @"guanzhu_img6", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ID"];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 80, 30);
        [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"guanzhu_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"guanzhu_pressed"] forState:UIControlStateSelected];
        if (!(indexPath.section == 4 || indexPath.section == 5)) {
            button.selected = YES;
        }
        cell.accessoryView = button;
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 13, 65, 65)];
        imageView.image = [UIImage imageNamed:_ima[indexPath.section]];
        [cell.contentView addSubview:imageView];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(130, 35, 150, 20)];
        label.text = _name[indexPath.section];
        label.font = [UIFont systemFontOfSize:18];
        [cell.contentView addSubview:label];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
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

- (void)press:(UIButton *) btn
{
    btn.selected = !btn.selected;
}

@end

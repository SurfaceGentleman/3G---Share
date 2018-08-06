//
//  Begin.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/27.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "Begin.h"

@interface Begin ()

@end

@implementation Begin

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView * begin = [[UIImageView alloc] initWithFrame:self.view.frame];
    begin.image = [UIImage imageNamed:@"开机界面.psd"];
    
    
    
    [self.view addSubview:begin];
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

//
//  collection_picture.h
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/3.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface collection_picture : UIViewController
<UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, copy)NSArray * image;
@property(nonatomic, strong)UIButton * btn;
@property(nonatomic, strong)NSMutableArray * btns;
@property(nonatomic, strong)UIImageView * se;

@end

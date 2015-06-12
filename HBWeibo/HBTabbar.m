//
//  HBTabbar.m
//  HBWeibo
//
//  Created by bottle on 15/6/12.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import "HBTabbar.h"
#import "HBTabbarButton.h"

@interface HBTabbar()
@property (nonatomic,strong) NSMutableArray *buttons;
@end

@implementation HBTabbar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //计算并设置自控件位置
    int btnCnts = self.subviews.count;
    int btnY = 0;
    int btnW = self.frame.size.width / btnCnts;
    int btnH = self.frame.size.height;
    for (int i=0; i<btnCnts; ++i) {
        int btnX = i * btnW;
        HBTabbarButton *btn = self.subviews[i];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

- (NSMutableArray *)buttons {
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (void)addButtonWithItem:(UITabBarItem *)item {
    HBTabbarButton *btn = [[HBTabbarButton alloc] init];
    btn.item = item;
    [self addSubview:btn];
    [self.buttons addObject:btn];
}

@end

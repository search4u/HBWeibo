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
@property (nonatomic,weak) HBTabbarButton *selectedBtn;
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
    NSInteger btnCnts = self.subviews.count;
    int btnY = 0;
    int btnW = self.frame.size.width / btnCnts;
    int btnH = self.frame.size.height;
    for (int i=0; i<btnCnts; ++i) {
        int btnX = i * btnW;
        HBTabbarButton *btn = self.subviews[i];
        btn.tag = i;
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
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    [self.buttons addObject:btn];
}

- (void)btnClicked:(HBTabbarButton*)btn {
    if ([self.delegate respondsToSelector:@selector(tabbar:DidSelectedBtnFrom:to:)]) {
        [self.delegate tabbar:self DidSelectedBtnFrom:self.selectedBtn.tag to:btn.tag];
    }
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}

@end

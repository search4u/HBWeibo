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
@property (nonatomic,weak) UIButton *composeBtn;
@end

@implementation HBTabbar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIButton *composeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [composeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_os7"] forState:UIControlStateNormal];
        [composeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted_os7"] forState:UIControlStateHighlighted];
        [composeBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [composeBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted_os7"] forState:UIControlStateHighlighted];
        [self addSubview:composeBtn];
        self.composeBtn = composeBtn;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //计算并设置自控件位置
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;

    NSInteger btnCnts = self.subviews.count;
    int btnY = 0;
    int btnW = self.frame.size.width / btnCnts;
    int btnH = self.frame.size.height;
    
    self.composeBtn.bounds = CGRectMake(0, 0, btnW, btnH);
    self.composeBtn.center = CGPointMake(w/2, h/2);
    for (int i=0; i<self.buttons.count; ++i) {
        int btnX = i * btnW;
        HBTabbarButton *btn = self.buttons[i];
        btn.tag = i;
        if (i > 1) {
            btnX += btnW;
        }
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

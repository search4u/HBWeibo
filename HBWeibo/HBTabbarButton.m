//
//  HBTabbarButton.m
//  HBWeibo
//
//  Created by bottle on 15/6/12.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import "HBTabbarButton.h"

@interface HBTabbarButton()

@end

@implementation HBTabbarButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)setItem:(UITabBarItem *)item {
    _item = item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, contentRect.size.height*0.7 ,contentRect.size.width, contentRect.size.height * 0.3);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 0,contentRect.size.width, contentRect.size.height * 0.7);
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

@end

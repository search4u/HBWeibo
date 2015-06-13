//
//  HBTabbar.h
//  HBWeibo
//
//  Created by bottle on 15/6/12.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HBTabbar;
@protocol HBTabbarDelegate <NSObject>

@optional

- (void)tabbar:(HBTabbar*)tabbar DidSelectedBtnFrom:(NSInteger)from to:(NSInteger)to;

@end


@interface HBTabbar : UIView

@property (nonatomic,weak) id<HBTabbarDelegate> delegate;

- (void)addButtonWithItem:(UITabBarItem *)item;


@end

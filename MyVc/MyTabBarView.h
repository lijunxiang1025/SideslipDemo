//
//  MyTabBarView.h
//  MyVc
//
//  Created by lijunxiang on 16/4/28.
//  Copyright © 2016年 lijunxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBarView : UIView
- (instancetype)initWithSelectImageArr:(NSArray*)selectImageArr andUnSelectImageArr:(NSArray*)unSelectImageArr andTitleArr:(NSArray*)titleArr andFrame:(CGRect)frame;
@end

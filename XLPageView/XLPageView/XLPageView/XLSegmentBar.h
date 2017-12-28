//
//  XLSegmentBar.h
//  supplier
//
//  Created by 郑雪利 on 2017/12/14.
//  Copyright © 2017年 Jingzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XLSegmentConfig;
@class XLSegmentBar;

#pragma mark -- XLSegmentBarDelegate
@protocol XLSegmentBarDelegate <NSObject>

- (void)segmentBarDidSelectedIndex:(NSInteger)index segmentBar:(XLSegmentBar *)segmentBar;

@end

@interface XLSegmentBar : UIView

/**  */
@property (nonatomic,weak)id<XLSegmentBarDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame config:(XLSegmentConfig *)config;

- (void)updateIndicatorWithProgress:(CGFloat)progress;

- (void)selectedIndex:(NSInteger)currentPage;

@end

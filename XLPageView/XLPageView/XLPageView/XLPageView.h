//
//  XLPageView.h
//  supplier
//
//  Created by 郑雪利 on 2017/12/19.
//  Copyright © 2017年 Jingzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XLSegmentBar;
@class XLSegmentConfig;
@class XLPageView;

@protocol XLPageViewDelegate<NSObject>

- (void)xl_pageViewDidSelectedIt˜em:(NSInteger)index pageView:(XLPageView *)pageView;

@end

@interface XLPageView : UIView

/**  */
@property (nonatomic,strong)XLSegmentBar *segmentBar;

/**  */
@property (nonatomic,strong)id<XLPageViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame config:(XLSegmentConfig *)config controllers:(NSArray *)controllers;
@end

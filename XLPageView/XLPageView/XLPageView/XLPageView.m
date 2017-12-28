//
//  XLPageView.m
//  supplier
//
//  Created by 郑雪利 on 2017/12/19.
//  Copyright © 2017年 Jingzhao. All rights reserved.
//

#import "XLPageView.h"
#import "XLSegmentBar.h"
#import "XLSegmentConfig.h"

static CGFloat SEGMENTBAR_HEIGHT = 44;
@interface XLPageView()<UIScrollViewDelegate,XLSegmentBarDelegate>

/**  */
@property (nonatomic,strong)UIScrollView *scrollView;

@end

@implementation XLPageView

- (instancetype)initWithFrame:(CGRect)frame config:(XLSegmentConfig *)config controllers:(NSArray *)controllers
{
    if (self = [super initWithFrame:frame]) {
        
        [self createSegmentBarWithConfig:config];
        
        [self setupScrollViewAndControllers:controllers];
    }
    return self;
}

- (void)createSegmentBarWithConfig:(XLSegmentConfig *)config
{
    _segmentBar = [[XLSegmentBar alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, SEGMENTBAR_HEIGHT) config:config];
    _segmentBar.delegate = self;
    [self addSubview:_segmentBar];
}

- (void)setupScrollViewAndControllers:(NSArray *)controllers
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SEGMENTBAR_HEIGHT, self.frame.size.width, self.frame.size.height)];
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(self.frame.size.width * controllers.count, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = YES;
    
    for (int i = 0; i < controllers.count; i++) {
        UIViewController *vc = controllers[i];
        [scrollView addSubview:vc.view];
        vc.view.frame = CGRectMake(scrollView.frame.size.width * i, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    }
    _scrollView = scrollView;
    [self addSubview:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //1.获取到偏移量
    CGFloat progress = scrollView.contentOffset.x / scrollView.contentSize.width;
    
    //2.更新indicatorView的位置
    [_segmentBar updateIndicatorWithProgress:progress];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    //2.更新segmentBar选中的按钮
    [_segmentBar selectedIndex:currentPage];
}

- (void)segmentBarDidSelectedIndex:(NSInteger)index segmentBar:(XLSegmentBar *)segmentBar {
    [self.scrollView setContentOffset:CGPointMake(index * self.frame.size.width, 0) animated:YES];
}

@end

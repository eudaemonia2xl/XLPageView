//
//  ViewController.m
//  XLPageView
//
//  Created by 郑雪利 on 2017/12/28.
//  Copyright © 2017年 郑雪利. All rights reserved.
//

#import "ViewController.h"
#import "XLSegmentBar.h"
#import "XLPageView.h"
#import "XLSegmentConfig.h"

@interface ViewController ()

/**  */
@property (nonatomic,strong)XLSegmentBar *segmentBar;
/** <#name#> */
@property (nonatomic,strong)XLPageView *pageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = self.segmentBar;
    
    [self.view addSubview:self.pageView];
}

- (XLSegmentBar *)segmentBar
{
    if (_segmentBar == nil) {
        XLSegmentConfig *config = [[XLSegmentConfig alloc] initWithTitles:@[@"在售",@"下架",@"定时"] pageWidth:200];
        _segmentBar = [[XLSegmentBar alloc] initWithFrame:CGRectMake(0, 0, 200, 44) config:config];
    }
    return _segmentBar;
}

- (XLPageView *)pageView
{
    if (_pageView == nil) {
        XLSegmentConfig *config = [[XLSegmentConfig alloc] initWithTitles:@[@"新订单",@"待处理",@"代配送",@"待处理",@"代配送"] pageWidth:self.view.frame.size.width];
        
        UIViewController *vc1 = [[UIViewController alloc] init];
        UIViewController *vc2 = [[UIViewController alloc] init];
        UIViewController *vc3 = [[UIViewController alloc] init];
        UIViewController *vc4 = [[UIViewController alloc] init];
        UIViewController *vc5 = [[UIViewController alloc] init];
        vc1.view.backgroundColor = [UIColor redColor];
        vc2.view.backgroundColor = [UIColor greenColor];
        vc3.view.backgroundColor = [UIColor lightGrayColor];
        vc4.view.backgroundColor = [UIColor blueColor];
        vc5.view.backgroundColor = [UIColor purpleColor];
        NSArray *vcs = @[vc1,vc2,vc3,vc4,vc5];
        _pageView = [[XLPageView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) config:config controllers:vcs];
    }
    return _pageView;
}



@end

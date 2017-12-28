//
//  XLSegmentBar.m
//  supplier
//
//  Created by 郑雪利 on 2017/12/14.
//  Copyright © 2017年 Jingzhao. All rights reserved.
//

#import "XLSegmentBar.h"
#import "XLSegmentConfig.h"

@interface XLSegmentBar()

@property (nonatomic,strong)UIButton *selectedBtn;

@property (nonatomic,strong)UIView *indicater;

@property (nonatomic,assign) CGFloat originX;

@end

@implementation XLSegmentBar

- (instancetype)initWithFrame:(CGRect)frame config:(XLSegmentConfig *)config
{
    if (self = [super initWithFrame:frame]) {
        [self createSegmentBarWithConfig:config];
    }
    return self;
}

- (void)createSegmentBarWithConfig:(XLSegmentConfig *)config
{
    CGFloat btnW = self.frame.size.width / config.titles.count;
    CGFloat btnH = self.frame.size.height - 2;
    for (int i = 0; i < config.titles.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnW * i, 0, btnW, btnH);
        [btn setTitle:config.titles[i] forState:UIControlStateNormal];
        btn.tag = i;
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:config.normalColor forState:UIControlStateNormal];
        [btn setTitleColor:config.selectedColor forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        if (i == 0) {
            btn.selected = YES;
            _selectedBtn = btn;
            btn.userInteractionEnabled = NO;
        }
    }
    
    UIView *indicater = [[UIView alloc] initWithFrame:CGRectMake(0, btnH, config.indicatorW, config.indicatorH)];
    indicater.backgroundColor = config.selectedColor;
    [self addSubview:indicater];
    _indicater = indicater;
}

- (void)btnClick:(UIButton *)sender
{
    _selectedBtn.selected = NO;
    _selectedBtn.userInteractionEnabled = YES;
    
    sender.selected = YES;
    sender.userInteractionEnabled = NO;
    _selectedBtn = sender;
    //1.indicatorView偏移
    if (self.delegate == nil) {
        [UIView animateWithDuration:0.25 animations:^{
            CGPoint center = _indicater.center;
            center.x = sender.center.x;
            _indicater.center = center;
        }];
    } else {
        //2.scrollview偏移
        if ([self.delegate respondsToSelector:@selector(segmentBarDidSelectedIndex:segmentBar:)]) {
            [self.delegate segmentBarDidSelectedIndex:sender.tag segmentBar:self];
        }
    }
}

- (void)updateIndicatorWithProgress:(CGFloat)progress
{
    //更新指示器的x坐标：增量就是这次比上次多了多少，所以用这次减去上次
    CGFloat originX = progress * self.frame.size.width;
    
    CGRect frame = _indicater.frame;
    frame.origin.x = _indicater.frame.origin.x + originX - _originX;
    _indicater.frame = frame;
    
    _originX = originX;
}

- (void)selectedIndex:(NSInteger)currentPage
{
    NSLog(@"%@",self.subviews);
    UIButton *btn = [self.subviews objectAtIndex:currentPage];
    if (btn != _selectedBtn) {
        _selectedBtn.selected = NO;
        _selectedBtn.userInteractionEnabled = YES;
        
        btn.selected = YES;
        btn.userInteractionEnabled = NO;
        
        _selectedBtn = btn;
    }
}

@end

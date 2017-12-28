//
//  XLSegmentConfig.m
//  supplier
//
//  Created by 郑雪利 on 2017/12/14.
//  Copyright © 2017年 Jingzhao. All rights reserved.
//

#import "XLSegmentConfig.h"

@implementation XLSegmentConfig

- (instancetype)initWithTitles:(NSArray *)titles pageWidth:(CGFloat)pageWidth
{
    if (self = [super init]) {
        _titles = titles;
        _indicatorW = pageWidth / titles.count;
        _indicatorH = 2;
        _selectedColor = [UIColor redColor];
        _normalColor = [UIColor lightGrayColor];
    }
    return self;
}

@end

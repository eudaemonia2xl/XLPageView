//
//  XLSegmentConfig.h
//  supplier
//
//  Created by 郑雪利 on 2017/12/14.
//  Copyright © 2017年 Jingzhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XLSegmentConfig : NSObject

@property (nonatomic,strong)NSArray *titles;
@property (nonatomic,strong)UIColor *selectedColor;

@property (nonatomic,strong)UIColor *normalColor;

@property (nonatomic,assign)CGFloat indicatorH;
@property (nonatomic,assign)CGFloat indicatorW;

- (instancetype)initWithTitles:(NSArray *)titles pageWidth:(CGFloat)pageWidth;

@end

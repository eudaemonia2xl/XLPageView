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
/** 标题数组 */
@property (nonatomic,strong)NSArray *titles;
/** 选中颜色 */
@property (nonatomic,strong)UIColor *selectedColor;
/** 正常颜色 */
@property (nonatomic,strong)UIColor *normalColor;
/** 标记得高度 */
@property (nonatomic,assign)CGFloat indicatorH;
/** 标记得宽度 */
@property (nonatomic,assign)CGFloat indicatorW;

- (instancetype)initWithTitles:(NSArray *)titles pageWidth:(CGFloat)pageWidth;

@end

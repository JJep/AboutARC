//
//  UIImageView+CircleImage.m
//  AboutARC
//
//  Created by Jep Xia on 2018/4/7.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "UIImageView+CircleImage.h"

@implementation UIImageView (CircleImage)
- (UIImage *)circleImage
{
    

    // NO代表透明
    UIGraphicsBeginImageContextWithOptions(self.image.size, NO, 0.0);
    
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 将图片画上去
    [self.image drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}
@end

//
//  UIImage+CircleImage.m
//  AboutARC
//
//  Created by Jep Xia on 2018/4/7.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "UIImage+CircleImage.h"

@implementation UIImage (CircleImage) 
-(UIImage *)bezierCircleImage:(CGRect) rect andCornerRadius:(CGFloat)cornerRadius {
    
    //开始对imageView进行画图
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius] addClip];
    [self drawInRect:rect];

    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束画图
    UIGraphicsEndImageContext();

    return image;
    
}

@end

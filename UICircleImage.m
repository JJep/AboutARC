//
//  UICircleImage.m
//  AboutARC
//
//  Created by Jep Xia on 2018/4/9.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "UICircleImage.h"

@implementation UICircleImage {
    NSCache *_cache ;
}


- (id)init {
    if ((self = [super init])) {
        _cache = [NSCache new];
        //将cache的size设置为50m
        _cache.countLimit = 100;
        _cache.totalCostLimit = 50 * 1024 * 1024;
    }
    return self;
}

-(UIImage *)bezierCircleImage:(CGRect) rect andCornerRadius:(CGFloat)cornerRadius data:(NSData *)data{
    
    NSData *cacheData = [_cache objectForKey:data];
    if (cacheData) {
        //cache hit
        return [UIImage imageWithData:cacheData];
    } else {
        //cache miss
        //开始对imageView进行画图
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
        //使用贝塞尔曲线画出一个圆形图
        [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius] addClip];
        [self drawInRect:rect];
        UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
        NSData* imageData = UIImagePNGRepresentation(image);
        //结束画图
        UIGraphicsEndImageContext();
        
        [_cache setObject:imageData forKey:data cost:imageData.length];
        
        return image;
        
    }
    
}
@end

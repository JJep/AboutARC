//
//  UICircleImage.h
//  AboutARC
//
//  Created by Jep Xia on 2018/4/9.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICircleImage : UIImage
- (UIImage *)bezierCircleImage:(CGRect) rect andCornerRadius:(CGFloat) cornerRadius data:(NSData*)data;
- (id)init;

@end

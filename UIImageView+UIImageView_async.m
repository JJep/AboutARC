//
//  UIImageView+UIImageView_async.m
//  AboutARC
//
//  Created by Jep Xia on 2018/4/1.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "UIImageView+UIImageView_async.h"

@implementation UIImageView (UIImageView_async)
-(void)jx_setImageWithUrl:(NSURL *)url
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData new];
        data = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = [UIImage imageWithData:data];
        });
    });
}
@end

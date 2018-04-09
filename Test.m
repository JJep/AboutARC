//
//  Test.m
//  AboutARC
//
//  Created by Jep Xia on 2018/3/27.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "Test.h"

@implementation Test
-(id)init
{
    self = [super init ];
    return self;
}

- (void)setObject:(id __strong)obj
{
    obj_ = obj;
}
@end

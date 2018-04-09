//
//  PasswordInputWindow.h
//  AboutARC
//
//  Created by Jep Xia on 2018/3/31.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordInputWindow : UIWindow
+ (PasswordInputWindow *)sharedInstance;
-(void)show;

@end

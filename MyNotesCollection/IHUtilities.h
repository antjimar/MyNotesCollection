//
//  IHUtilities.h
//  Presenting
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 10/2/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IHUtilities : NSObject

+ (UIButton *)createButtonWithTitle:(NSString *)title state:(UIControlState)state type:(UIButtonType)type frame:(CGRect)frame;
+ (UIColor *)ramdomColor;
+ (CGRect)getFrameStatusBar;
+ (CGRect)getFrameMainScreen;

@end

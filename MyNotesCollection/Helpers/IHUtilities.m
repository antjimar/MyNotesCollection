//
//  IHUtilities.m
//  Presenting
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 10/2/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "IHUtilities.h"

@implementation IHUtilities


+ (UIButton *)createButtonWithTitle:(NSString *)title
                              state:(UIControlState)state
                               type:(UIButtonType)type
                              frame:(CGRect)frame {
    
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    [button setTitle:title forState:state];
    
    return button;
}


+ (UIColor *)ramdomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return color;
}


#pragma mark - Geometry Methods

+ (CGRect)getFrameStatusBar {
    return [UIApplication sharedApplication].statusBarFrame;
}

+ (CGRect)getFrameMainScreen {
    return [[UIScreen mainScreen] bounds];
}

@end

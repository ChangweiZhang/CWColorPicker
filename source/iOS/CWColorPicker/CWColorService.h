//
//  CWColorService.h
//  CWColorPickerDemo
//
//  Created by 张昌伟 on 15/10/19.
//  Copyright © 2015年 Changwei Zhang. All rights reserved.
//
#import <UIKit/UIKit.h>


@interface CWColorService : NSObject

+ (UIColor*)colorFromRGB:(NSArray*)rgb;

+(NSArray*)rgbFromHSB:(NSArray*)hsb;

@end

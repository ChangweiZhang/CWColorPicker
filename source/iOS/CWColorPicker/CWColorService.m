//
//  CWColorService.m
//  CWColorPickerDemo
//
//  Created by 张昌伟 on 15/10/19.
//  Copyright © 2015年 Changwei Zhang. All rights reserved.
//


#import "CWColorService.h"

@implementation CWColorService : NSObject

+(UIColor *)colorFromRGB:(NSArray *)rgb{
    return [UIColor colorWithRed:[[rgb objectAtIndex:0] floatValue]/255.0 green:[[rgb objectAtIndex:1] floatValue]/255.0 blue:[[rgb objectAtIndex:2] floatValue]/255.0 alpha:1];
}

+(NSArray *)rgbFromHSB:(NSArray *)hsb{
    NSMutableArray *rgb = [NSMutableArray arrayWithObjects:@0,@0,@0 ,nil];
    float hValue = [[hsb objectAtIndex:0] floatValue];
    /*
     Firstly, we need to calculate RGB value, when the HSB value is (h,100%,100%).
     H         Color     Value
     ----------------------------
     0-60         G       0->255
     60-120       R       255->0
     120-180      B       0->255
     180-240      G       255->0
     240-360      R       0->255
     300-360      B       255->0
     */
    if(hValue<=60){
        [rgb replaceObjectAtIndex:0 withObject:@255];
        [rgb replaceObjectAtIndex:1 withObject:[NSNumber numberWithFloat:(hValue/360.0*255)] ];
    }else if(hValue<=120){
        hValue -= 60;
        [rgb replaceObjectAtIndex:1 withObject:@255];
        [rgb replaceObjectAtIndex:0 withObject:[NSNumber numberWithFloat:((1-hValue/60.0)*255)] ];
    }else if(hValue<=180){
        hValue -= 120;
        [rgb replaceObjectAtIndex:1 withObject:@255];
        [rgb replaceObjectAtIndex:0 withObject:[NSNumber numberWithFloat:((1-hValue/60.0)*255)] ];
    }else if(hValue<=240){
        hValue -= 180;
        [rgb replaceObjectAtIndex:2 withObject:@255];
        [rgb replaceObjectAtIndex:1 withObject:[NSNumber numberWithFloat:((1-hValue/60.0)*255)] ];
    }else if(hValue <300){
        hValue -= 240;
        [rgb replaceObjectAtIndex:2 withObject:@255];
        [rgb replaceObjectAtIndex:0 withObject:[NSNumber numberWithFloat:(hValue/60.0*255)] ];
    }else{
        hValue -= 300;
        [rgb replaceObjectAtIndex:0 withObject:@255];
        [rgb replaceObjectAtIndex:2 withObject:[NSNumber numberWithFloat:((1-hValue/60.0)*255)] ];
    }
    
    /*
     Secondly, acorrding to the value of staturation, we can calculate the rgb value, when the value of hsb is (h,s,100%)
     -------------------------
     r"= r'+ (255 - r') * s
     g"= g'+ (255 - g') * s
     b"= b'+ (255 - b') * s
     */
    float sValue=[[hsb objectAtIndex:1] floatValue];
    for (int i = 0; i < 3; i++)
    {
        float value =[[rgb objectAtIndex:i] floatValue];
        NSNumber *rgbValue=[NSNumber numberWithFloat:(value+(255-value)*sValue)];
        [rgb replaceObjectAtIndex:i withObject:rgbValue];
        
    }
    
    /*
     Finally, we need to calculate the real value of rgb, according to the value of brightness
     r = r" * br
     g = g" * br
     b = g" * br
     */
    float bValue = [[hsb objectAtIndex:2] floatValue];
    for (int i = 0; i < 3; i++)
    {
        
        [rgb replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:((int)([[rgb objectAtIndex:i] floatValue]*bValue+0.5))]];
    }
    
    return rgb;
    
}

@end
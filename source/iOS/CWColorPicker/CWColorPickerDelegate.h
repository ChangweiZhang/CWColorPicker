//
//  CWColorPickerDelegate.h
//  CWColorPicker
//
//  Created by 张昌伟 on 15/10/19.
//  Copyright © 2015年 Changwei Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CWColorPickerDelegate <NSObject>

@required
-(void)colorPickedWithSuccess:(UIColor*)color;
-(void)colorPickedWithFailture:(NSError *)error;


@end

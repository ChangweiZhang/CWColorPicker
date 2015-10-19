//
//  CWColorPicker.h
//  CWColorPicker
//
//  Created by 张昌伟 on 15/10/19.
//  Copyright © 2015年 Changwei Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWColorPickerDelegate.h"

@interface CWColorPicker : UIView


//block
@property (nonatomic,copy) void(^colorSelected)(UIColor*);

//delegate
@property (nonatomic) id<CWColorPickerDelegate> delegate;

@end

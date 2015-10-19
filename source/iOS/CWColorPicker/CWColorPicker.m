//
//  CWColorPicker.m
//  CWColorPicker
//
//  Created by 张昌伟 on 15/10/19.
//  Copyright © 2015年 Changwei Zhang. All rights reserved.
//

#import "CWColorPicker.h"
#import <UIKit/UIKit.h>
#import "CWColorService.h"


@interface CWColorPicker ()

// color picker panel image
@property (nonatomic) UIImageView *imageView;

//color result
@property (nonatomic) UIColor *selectedColor;

@end

@implementation CWColorPicker

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self!=nil){
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _imageView.image = [UIImage imageNamed:@"color-pan.png" inBundle: [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"Resource" ofType:@"bundle"]] compatibleWithTraitCollection:nil];
        _imageView.userInteractionEnabled = YES;
        // add tap gesture
        [_imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectColor:)]];
        
        [self addSubview:_imageView];
    };
    
    self.backgroundColor = [UIColor blueColor];
    
    return  self;
}

//calculate color value and return result
-(void)selectColor:(UITapGestureRecognizer *)gesture{
    
    NSLog(@"%@",NSStringFromCGPoint([gesture locationInView:self]));
    
    CGPoint position = [gesture locationInView:_imageView];
    
    NSNumber *hValue = [NSNumber numberWithInt:((int)position.x/self.frame.size.width*360)];
    
    NSNumber *sValue = [NSNumber numberWithFloat:[[NSString stringWithFormat:@"%.2f",(position.y/self.frame.size.height)] floatValue]];
    
    NSMutableArray *hsb = [NSMutableArray arrayWithObjects:hValue,sValue,@1, nil];
    
    _selectedColor = [CWColorService colorFromRGB:[CWColorService rgbFromHSB:hsb]];
   
    //invoke block method
    _colorSelected(_selectedColor);
    
    //invoke delegate methods
    if(_selectedColor!=nil)
      [ _delegate colorPickedWithSuccess:_selectedColor];
    else
        [_delegate colorPickedWithFailture:[NSError errorWithDomain:@"输入HSB值不合法" code:500 userInfo:nil]];
}

@end

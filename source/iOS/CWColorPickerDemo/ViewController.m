//
//  ViewController.m
//  CWColorPickerDemo
//
//  Created by 张昌伟 on 15/10/19.
//  Copyright © 2015年 Changwei Zhang. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)



@interface ViewController ()
@property (nonatomic,strong) CWColorPicker *colorPicker;
@property (nonatomic,strong) UIView *canvas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _colorPicker = [[CWColorPicker alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-200, 200, 200)];
   
    
    /*
     there are two methods,including block and delgate. you need to choice one method to use.
     */
    
    //delegate
    _colorPicker.delegate = self;
    
    //block
    [self setBlock:_colorPicker];
    
    [self.view addSubview:_colorPicker];
    
    _canvas = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2+50, 100, 100)];
    _canvas.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_canvas];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/* 
 delegate
 */
-(void)colorPickedWithFailture:(NSError *)error{
    NSLog(@"%@",error);
}

-(void)colorPickedWithSuccess:(UIColor *)color{
   // [self changeColor:color];
}


-(void) changeColor:(UIColor*)color{
    _canvas.backgroundColor = color;
}


-(void) setBlock:(id) target{
    __weak typeof(ViewController) *this = self;
    _colorPicker.colorSelected = ^(UIColor *color){
        [this changeColor:color];
    };
}

@end

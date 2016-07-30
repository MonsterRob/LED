//
//  ViewController.m
//  LED_1
//
//  Created by 王召洲 on 16/7/29.
//  Copyright © 2016年 王召洲. All rights reserved.
//
#import "playBoard.h"
#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()
{
    playBoard *view;
    NSTimer *timer;
    UITextField *txt;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    view = [[playBoard alloc]initWithFrame:self.view.bounds];
    
    
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(0.7);
    }];
    
    txt = [[UITextField alloc]init];
    txt.borderStyle = UITextBorderStyleRoundedRect;
    txt.placeholder = @"HELOO";
    txt.textAlignment = NSTextAlignmentCenter;
    txt.autocorrectionType = UITextAutocorrectionTypeNo;
    txt.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:txt];
    
    [txt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(0.3);
        make.height.equalTo(@30);
        
    }];
    
    UIButton *btn= [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(timerGo:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 20;
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
    
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.view).offset(-30);
        make.width.equalTo(self.view).multipliedBy(0.2);
        make.height.equalTo(@60);
    }];
    
    
    timer =  [NSTimer scheduledTimerWithTimeInterval:1/60.0 target:self selector:@selector(reDraw) userInfo:nil repeats:YES];
    timer.fireDate = [NSDate distantFuture];
    
    
    
}
-(void)timerGo:(UIButton *)sender  {
    if ([[sender titleForState:UIControlStateNormal] isEqualToString:@"开始"]) {
        [sender setTitle:@"结束" forState:UIControlStateNormal];
        
        view.string = txt.text;
        timer.fireDate = [NSDate distantPast];
        
    }
    else {
        [sender setTitle:@"开始" forState:UIControlStateNormal];
        timer.fireDate = [NSDate distantFuture];

    }
}
-(void)reDraw {
    // 重画
    
    [view setNeedsDisplay];
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeLeft;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [txt resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

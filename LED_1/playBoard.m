//
//  playBoard.m
//  LED_1
//
//  Created by 王召洲 on 16/7/29.
//  Copyright © 2016年 王召洲. All rights reserved.
//

#import "playBoard.h"

@implementation playBoard



- (void)drawRect:(CGRect)rect {
    
    NSUInteger length = self.string.length;
    NSMutableArray *strA = [NSMutableArray array];
    
    for ( int i = 0; i < length; i++) {
        NSString *str = [self.string substringWithRange:NSMakeRange(i, 1)];
        [strA addObject:str];
    }
    
    
    static CGFloat y = 0;
    
//    NSArray *strArr = @[@"🀄️",@"🚀",@"🐔",@"🐂",@"🐍",@"🐷",@"🐟",@"🐸",@"✈️",@"🍁",@"🏠",@"❄️",@"🌲",@"🍎",@"🍌",@"🍉",@"✂️",@"💃"];
    
    
    for (int i = 0; i < strA.count; i++) {
        NSString *s = strA[i];
        
        [s drawAtPoint:CGPointMake(rect.size.width-y +i * 200, rect.size.height*0.2) withAttributes:@{NSForegroundColorAttributeName :[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:200]}];
    }
    
    
    y += 3;
    if (y >= 100*strA.count+strA.count*100+rect.size.width) {
        y=0;
    }
}

@end

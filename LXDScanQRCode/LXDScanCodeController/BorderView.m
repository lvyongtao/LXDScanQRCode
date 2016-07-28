//
//  BorderView.m
//  LXDScanQRCode
//
//  Created by lvyongtao on 16/7/26.
//  Copyright © 2016年 cnpayany. All rights reserved.
//

#import "BorderView.h"

#define line_width 3.0

#define space 1.0

#define border_lenght 15.0

@implementation BorderView


- (void)drawRect:(CGRect)rect{
    
    UIBezierPath *topleftB =[UIBezierPath bezierPath];
    CGPoint topleftPoint = CGPointMake(space,space);
    [topleftB moveToPoint:CGPointMake(topleftPoint.x, topleftPoint.y + border_lenght)];
    [topleftB addLineToPoint:CGPointMake(topleftPoint.x, topleftPoint.y)];
    [topleftB addLineToPoint:CGPointMake(topleftPoint.x + border_lenght, topleftPoint.y)];
    [topleftB setLineWidth:line_width];
    [[UIColor colorWithRed:83 /255.0 green:239/255.0 blue:111/255.0 alpha:1.0] setStroke];
    [topleftB stroke];
    
    
    UIBezierPath *bottomleftB =[UIBezierPath bezierPath];
    
    CGPoint bottomleftPoint = CGPointMake(space, space + self.frame.size.height- space *2);
    
    [bottomleftB moveToPoint:CGPointMake(bottomleftPoint.x, bottomleftPoint.y - border_lenght)];
    [bottomleftB addLineToPoint:CGPointMake(bottomleftPoint.x, bottomleftPoint.y)];
    [bottomleftB addLineToPoint:CGPointMake(bottomleftPoint.x + border_lenght, bottomleftPoint.y)];
    
    [bottomleftB setLineWidth:line_width];
    [[UIColor colorWithRed:83 /255.0 green:239/255.0 blue:111/255.0 alpha:1.0] setStroke];
    [bottomleftB stroke];
    
    
    UIBezierPath *toprightB =[UIBezierPath bezierPath];
    CGPoint toprightPoint = CGPointMake(space + self.frame.size.width - space *2, space);
    [toprightB moveToPoint:CGPointMake(toprightPoint.x - border_lenght, toprightPoint.y)];
    [toprightB addLineToPoint:CGPointMake(toprightPoint.x, toprightPoint.y)];
    [toprightB addLineToPoint:CGPointMake(toprightPoint.x, toprightPoint.y + border_lenght)];
    [toprightB setLineWidth:line_width];
    [[UIColor colorWithRed:83 /255.0 green:239/255.0 blue:111/255.0 alpha:1.0] setStroke];
    [toprightB stroke];
    
    
    UIBezierPath *bottomrightB =[UIBezierPath bezierPath];
    
    CGPoint bottomrightPoint = CGPointMake(space + self.frame.size.width - space*2, space + self.frame.size.height - space*2);
    [bottomrightB moveToPoint:CGPointMake(bottomrightPoint.x, bottomrightPoint.y - border_lenght)];
    [bottomrightB addLineToPoint:CGPointMake(bottomrightPoint.x, bottomrightPoint.y)];
    [bottomrightB addLineToPoint:CGPointMake(bottomrightPoint.x - border_lenght, bottomrightPoint.y)];
    
    [bottomrightB setLineWidth:line_width];
    //83 /255.0, 239/255.0, 111/255.0, 1)
    [[UIColor colorWithRed:83 /255.0 green:239/255.0 blue:111/255.0 alpha:1.0] setStroke];
    [bottomrightB stroke];
    
    
    
    
    
    
    
    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    [self addCornerLineWithContext:ctx rect:self.frame];
}

@end

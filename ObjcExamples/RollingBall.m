//
//  RollingBall.m
//  ObjcExamples
//
//  Created by thanh tung on 11/30/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "RollingBall.h"

@interface RollingBall ()

@end

@implementation RollingBall
{
    UIImageView * ball;
    CGFloat radius;
    CGFloat angle;
    NSTimer * timer;
    NSTimer * timer2;
    BOOL temp;
}
- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    temp = true; // true > ball roll right - fale > ball roll left
    angle = 0.0;
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(rollBall) userInfo:nil repeats:true];
    
    
}

-(void)addBall{
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball"]];
    radius = 32.0;
    CGSize mainWiewSize = self.view.bounds.size;
    ball.center = CGPointMake(radius, mainWiewSize.height*0.5);
    [[self view] addSubview:ball];
}

-(void)rollBall{
    if (ball.center.x <= self.view.bounds.size.width-radius && temp == true) {
        CGFloat deltaAngle = 0.1;
        angle += deltaAngle;
        ball.transform = CGAffineTransformMakeRotation(angle);
        ball.center = CGPointMake(ball.center.x + deltaAngle * radius, ball.center.y);
        if (ball.center.x > self.view.bounds.size.width-radius) {
            temp = false;
        }
    }
    if (temp == false) {
        CGFloat deltaAngle = -0.1;
        angle += deltaAngle;
        NSLog(@"%f",angle);
        ball.transform = CGAffineTransformMakeRotation(angle);
        ball.center = CGPointMake(ball.center.x + deltaAngle * radius, ball.center.y);
        if (ball.center.x < radius) {
            temp = true;
        }
    }
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}


@end

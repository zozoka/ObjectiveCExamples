//
//  DropBall.m
//  ObjcExamples
//
//  Created by thanh tung on 12/1/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "DropBall.h"

@interface DropBall ()

@end

@implementation DropBall
{
    UIImageView * ball;
    NSTimer * timer;
    CGFloat ballRadius;
    CGFloat x,y,vellocityY, accellerateY, maxHeight;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];
    
    
}

-(void) addBall{
    CGSize mainViewSize = self.view.bounds.size;
    ball = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ball"]];
    ballRadius = 32.0;
    x = mainViewSize.width*0.5;
    y = ballRadius;
    vellocityY = 0.0;
    accellerateY = 0.25;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    maxHeight = mainViewSize.height - ballRadius - statusNavigationBarHeight;
    ball.center = CGPointMake(x, y);
    [self.view addSubview:ball];
}

-(void) dropBall{
    vellocityY += accellerateY;
    y += vellocityY;
    if (y>maxHeight) {
        vellocityY = -vellocityY*0.9;
        y = maxHeight;
    }
    ball.center = CGPointMake(x, y);
}



@end

//
//  EarthAndSun.m
//  ObjcExamples
//
//  Created by thanh tung on 11/30/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "EarthAndSun.h"
#import "MyUtil.h"

@interface EarthAndSun ()

@end

@implementation EarthAndSun
{
    UIImageView * sun;
    UIImageView * earth;
    CGPoint sunCenter;
    CGFloat distanceEarthToSun;
    CGFloat angle;
    NSTimer * timer;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor blackColor];
    [self addSunAndEarth];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                               target:self
                                             selector:@selector(spinAngle)
                                             userInfo:nil
                                              repeats:true];
}

- (void) addSunAndEarth{
    UIImage *imgEarth = [UIImage imageNamed:@"Earth"];
    UIImage *imgEarthScaleSize = [MyUtil imageWithImage:imgEarth scaledToSize:CGSizeMake(24.0, 24.0)];
    earth = [[UIImageView alloc]initWithImage:imgEarthScaleSize];
    sun = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sun"]];

    CGSize mainViewSize = self.view.bounds.size;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    sunCenter = CGPointMake(mainViewSize.width*0.5, (statusNavigationBarHeight + mainViewSize.height)*0.5);
    distanceEarthToSun = mainViewSize.width*0.5 - 32.0;
    sun.center = sunCenter;
    angle = 0.0;
    earth.center = [self computePositionOfEarth:angle];
    [self.view addSubview:sun];
    [self.view addSubview:earth];
}


-(CGPoint) computePositionOfEarth:(CGFloat)_angle{
    return CGPointMake(sunCenter.x + distanceEarthToSun*cos(_angle),
                       sunCenter.y + distanceEarthToSun*sin(_angle));
}

-(void)spinAngle{
    angle = angle+0.01;
    earth.center = [self computePositionOfEarth:angle];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}

@end

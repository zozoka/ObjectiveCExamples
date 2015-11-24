//
//  SkewImage.m
//  ObjcExamples
//
//  Created by thanh tung on 11/24/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "SkewImage.h"

@interface SkewImage ()
@property (weak, nonatomic) IBOutlet UIImageView *imageNgocTrinh;
@property (weak, nonatomic) IBOutlet UISlider *sliderNgocTrinh;

@end

@implementation SkewImage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sliderNgocTrinh.value=0;
    [self.sliderNgocTrinh addTarget:self
                             action:@selector(sliderValueChange:)
                   forControlEvents:UIControlEventValueChanged];
    
}

-(void) sliderValueChange:(UISlider*) slider{
    CGFloat angle = 180.0f * self.sliderNgocTrinh.value * M_PI / 180.0f;
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0/ -500;
    t = CATransform3DRotate(t, angle, 0, 1, 0);
    
    CALayer *myLayer =  self.imageNgocTrinh.layer;
    myLayer.transform = t;
}



@end

//
//  UIViewBasic.m
//  ObjcExamples
//
//  Created by thanh tung on 11/27/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "UIViewBasic.h"

@interface UIViewBasic ()

@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UISlider *sliderAlpha;
@property (weak, nonatomic) IBOutlet UISlider *rotateSlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;

@end

@implementation UIViewBasic

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)switchChangeValue:(UISwitch *)sender {
    [self myView].hidden = !sender.on;
}

-(void) rotateAndScale{
    CGAffineTransform transformRotate = CGAffineTransformMakeRotation([self rotateSlider].value*M_PI);
    CGAffineTransform transformScale = CGAffineTransformMakeScale([self scaleSlider].value, [self scaleSlider].value);
    [self myView].transform = CGAffineTransformConcat(transformRotate, transformScale);
}

- (IBAction)changeValueSliderAlpha:(UISlider *)sender {
    [self myView].alpha = self.sliderAlpha.value;
}

- (IBAction)changeValueSliderRotate:(UISlider *)sender {
    [self rotateAndScale];
}
- (IBAction)changeValueSliderScale:(UISlider *)sender {
    [self rotateAndScale];
}

- (IBAction)segmentedChange:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self myView].backgroundColor = [UIColor blackColor];
            [self segmented].tintColor = [UIColor blackColor];
            break;
        case 1:
            [self myView].backgroundColor = [UIColor redColor];
            [self segmented].tintColor = [UIColor redColor];
            break;
        case 2:
            [self myView].backgroundColor = [UIColor greenColor];
            [self segmented].tintColor = [UIColor greenColor];
            break;
        case 3:
            [self myView].backgroundColor = [UIColor blueColor];
            [self segmented].tintColor = [UIColor blueColor];
            break;
        default:
            break;
    }
}


@end

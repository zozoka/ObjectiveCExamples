//
//  CustomerSlider.m
//  ObjcExamples
//
//  Created by thanh tung on 11/19/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "CustomerSlider.h"

@interface CustomerSlider ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tooltipContrain;
@property (weak, nonatomic) IBOutlet UIImageView *tooltipImage;
@property (weak, nonatomic) IBOutlet UILabel *labelValueSlider;

@end

@implementation CustomerSlider

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.slider setThumbImage:[UIImage imageNamed:@"slider-cap"] forState:UIControlStateNormal];
    [self.slider setMinimumTrackImage:[UIImage imageNamed:@"slider-track-fill"] forState:UIControlStateNormal];
    [self.slider setMaximumTrackImage:[UIImage imageNamed:@"slider-track"] forState:UIControlStateNormal];
    self.tooltipImage.hidden = true;
    self.labelValueSlider.hidden = true;


    //[self.slider setMinimumValueImage:[UIImage imageNamed:@"MuteSpeaker"]];
    //[self.slider setMaximumValueImage:[UIImage imageNamed:@"MaxSpeaker"]];
    
    //UIGraphicsBeginImageContext(self.view.frame.size);
    //[[UIImage imageNamed:@"background.jpg"] drawInRect:self.view.bounds];
    
    //UIGraphicsEndImageContext();
    //UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
}
- (IBAction)onChangedValueSlider:(id)sender {
    self.tooltipImage.hidden = false;
    self.labelValueSlider.hidden = false;
    self.tooltipContrain.constant = self.slider.value*self.slider.frame.size.width-30;
    self.labelValueSlider.text = [NSString stringWithFormat:@"%1.0f%%",self.slider.value*100];
}

@end

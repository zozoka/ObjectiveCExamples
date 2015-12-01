//
//  DemoSlider.m
//  ObjcExamples
//
//  Created by thanh tung on 11/19/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "DemoSlider.h"

@interface DemoSlider ()

@end

@implementation DemoSlider
{
    NSTimer* _time;
    NSTimer* _time2;
    __weak IBOutlet UISlider *slider;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //slider.transform = CGAffineTransformMakeRotation(-M_PI_2);
    slider.tintColor = [UIColor redColor];
    [self runSlider];
}

-(void) demoSlider{
    //slider.value=0;
    slider.value += 0.05;
    if (slider.value >= 1) {
        slider.value =1;
        [_time invalidate]; //stop nstimer
        _time2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runSliderBack) userInfo:nil repeats:true];
    }
    NSLog(@"value slider: %f",slider.value);
}

-(void)runSlider{
    _time = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(demoSlider)
                                           userInfo:nil
                                            repeats:true];

}

-(void)runSliderBack{
    slider.value -= 0.05;
    if (slider.value <= 0) {
        slider.value=0;
        [_time2 invalidate];
        [self runSlider];
    }
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_time invalidate];
    _time = nil;
    [_time2 invalidate];
    _time2 = nil;
}

@end

//
//  DemoSelector.m
//  ObjcExamples
//
//  Created by thanh tung on 11/13/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "DemoSelector.h"

@interface DemoSelector ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *crunchData;
@end

@implementation DemoSelector

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self performSelector:@selector(hideSlider) withObject:nil afterDelay:2];
    //self.view.backgroundColor = [UIColor redColor];

}
- (IBAction)onCrundData:(id)sender {
    //[self performSelectorInBackground:@selector(doCrunchData) withObject:nil];
    //[self performSelectorOnMainThread:@selector(doCrunchData) withObject:nil waitUntilDone:true];
    [self performSelectorOnMainThread:@selector(processData:) withObject:@{@"apple":@"tao",@"lemon":@"chanh"} waitUntilDone:true];
}


- (void)doCrunchData{
    [NSThread sleepForTimeInterval:2];
}

- (void)hideSlider{
    self.slider.hidden = true;
}

- (void)processData:(NSDictionary*) data{
    for (NSString* key in [data allKeys]) {
        NSLog(@"key: %@ - value: %@", key, [data valueForKey:key]);
    }
}
- (IBAction)changeValueSlider:(id)sender {
    float value = _slider.value;
    //NSLog(@"value: %f",value);
    self.view.backgroundColor = [UIColor colorWithRed:0 green:5 blue:0 alpha:value];
}

@end

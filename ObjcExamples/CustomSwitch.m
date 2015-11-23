//
//  CustomSwitch.m
//  ObjcExamples
//
//  Created by thanh tung on 11/21/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "CustomSwitch.h"

@interface CustomSwitch ()
@property (weak, nonatomic) IBOutlet UIButton *butOnValue;
@property (weak, nonatomic) IBOutlet UIButton *butOffValue;

@end

@implementation CustomSwitch
{
    bool value;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    value = false;
}

- (IBAction)pressON:(id)sender {
    UIImage* imgON = [UIImage imageNamed:@"ON-white"];
    UIImage* imgOFF = [UIImage imageNamed:@"OFF-black"];
    [[self butOnValue]setImage:imgON
                      forState:UIControlStateNormal];
    [[self butOffValue]setImage:imgOFF
                       forState:UIControlStateNormal];
    value = true;
    NSLog(@"value: %d",value);
    
}

- (IBAction)pressOFF:(id)sender {
    UIImage* imgON = [UIImage imageNamed:@"ON-black"];
    UIImage* imgOFF = [UIImage imageNamed:@"OFF-white"];
    [[self butOffValue] setImage:imgOFF
                        forState:UIControlStateNormal];
    [[self butOnValue]   setImage:imgON
                         forState:UIControlStateNormal];
    value = false;
    NSLog(@"value: %d",value);
}

@end

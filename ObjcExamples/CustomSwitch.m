//
//  CustomSwitch.m
//  ObjcExamples
//
//  Created by thanh tung on 11/21/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "CustomSwitch.h"
#import "CustomSwitchCore.h"

@interface CustomSwitch ()
@property (weak, nonatomic) IBOutlet UIButton *butOnValue;
@property (weak, nonatomic) IBOutlet UIButton *butOffValue;

@end

@implementation CustomSwitch
{
    CustomSwitchCore* mySwitch;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    mySwitch = [[CustomSwitchCore alloc]initWithFrame:CGRectMake(0,0,132,51)];
    mySwitch.center = CGPointMake(self.view.bounds.size.width * 0.5, 200);
    //NSLog(@"%@",NSStringFromCGPoint(mySwitch.center));
    
    [self.view addSubview:mySwitch];
    [mySwitch addTarget:self
                 action:@selector(switchChange:)
       forControlEvents:UIControlEventValueChanged];
}

-(void) switchChange:(CustomSwitchCore*) cSwitch{
    NSLog(@"value: %d",cSwitch.value);
}

- (IBAction)pressON:(id)sender {

    UIImage* imgON = [UIImage imageNamed:@"ON-white"];
    UIImage* imgOFF = [UIImage imageNamed:@"OFF-black"];
    [[self butOnValue]setImage:imgON
                      forState:UIControlStateNormal];
    [[self butOffValue]setImage:imgOFF
                       forState:UIControlStateNormal];
    //NSLog(@"value: %d",1);
    
}

- (IBAction)pressOFF:(id)sender {
    UIImage* imgON = [UIImage imageNamed:@"ON-black"];
    UIImage* imgOFF = [UIImage imageNamed:@"OFF-white"];
    [[self butOffValue] setImage:imgOFF
                        forState:UIControlStateNormal];
    [[self butOnValue]   setImage:imgON
                         forState:UIControlStateNormal];
    //NSLog(@"value: %d",0);
}

@end

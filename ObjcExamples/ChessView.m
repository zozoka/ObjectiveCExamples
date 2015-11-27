//
//  ChessView.m
//  ObjcExamples
//
//  Created by thanh tung on 11/27/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "ChessView.h"

@interface ChessView ()

@end

@implementation ChessView
{
    CGFloat margin;
    UIView* containerView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    margin = 10.0;
    [self view].backgroundColor = [UIColor grayColor];
    //self.view.backgroundColor = [UIColor grayColor];
    containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - margin*2, self.view.bounds.size.width - margin*2)];
    containerView.backgroundColor = [UIColor blackColor];
    containerView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    [[self view] addSubview:containerView];
    float cellWidth = (self.view.bounds.size.width-margin*2)/8;
    for (int rowIndex = 0; rowIndex <8; rowIndex++) {
        for (int colIndex = 0; colIndex <8; colIndex++) {
            CGRect rect = CGRectMake(colIndex * cellWidth, rowIndex * cellWidth, cellWidth, cellWidth);
            UIView* cell = [[UIView alloc] initWithFrame:rect];
            if (rowIndex % 2 == 0) {
                cell.backgroundColor = (colIndex % 2 == 0)?[UIColor blackColor]:[UIColor whiteColor];
            }else{
                cell.backgroundColor = (colIndex % 2 == 0)?[UIColor whiteColor]:[UIColor blackColor];
            }
            [containerView addSubview:cell];
        }
    }
    
    UISlider* slider = [[UISlider alloc]initWithFrame:CGRectMake(20.0, self.view.bounds.size.height-100.0, self.view.bounds.size.width-40.0, 10.0)];
    slider.minimumValue = -1;
    slider.maximumValue = 1;
    slider.value = 0;
    [slider addTarget:self action:@selector(onRotate:) forControlEvents:UIControlEventValueChanged];
    [[self view] addSubview:slider];
}

-(void)onRotate:(UISlider*) sender{
    containerView.transform = CGAffineTransformMakeRotation(sender.value* M_PI);
}
@end

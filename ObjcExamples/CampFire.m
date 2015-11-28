//
//  CampFire.m
//  ObjcExamples
//
//  Created by thanh tung on 11/28/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "CampFire.h"

@interface CampFire ()
{
    UIImageView* fire;
}

@end

@implementation CampFire

-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self burnFire];

}

-(void)burnFire{
    fire = [[UIImageView alloc]initWithFrame:self.view.bounds];
    NSMutableArray* image = [[NSMutableArray alloc] initWithCapacity:17];
    for (int i =1; i<18; i++) {
        NSString* fireName;
        if (i<10) {
            fireName = [NSString stringWithFormat:@"campFire0%d.gif",i];
        }else{
            fireName =[NSString stringWithFormat:@"campFire%d.gif",i];
        }
        [image addObject:[UIImage imageNamed:fireName]];
    }
    
    fire.animationImages = image;
    fire.animationDuration =1;
    fire.animationRepeatCount = 0;
    [[self view] addSubview:fire];
    [fire startAnimating];
}



@end

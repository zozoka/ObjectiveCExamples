//
//  FlyingBird.m
//  ObjcExamples
//
//  Created by thanh tung on 11/28/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "FlyingBird.h"

@interface FlyingBird ()

@end

@implementation FlyingBird
{
    UIImageView* bird;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawJungle];
    [self addBird];
    [self flyUpAndDown];
}

-(void) drawJungle{
    UIImageView* background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    background.frame = self.view.bounds;
    background.contentMode = UIViewContentModeScaleAspectFill;
    [[self view] addSubview:background];
}

-(void)addBird{
    bird = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 110, 68)];
    bird.animationImages= @[[UIImage imageNamed:@"bird0"],
                            [UIImage imageNamed:@"bird1"],
                            [UIImage imageNamed:@"bird2"],
                            [UIImage imageNamed:@"bird3"],
                            [UIImage imageNamed:@"bird4"],
                            [UIImage imageNamed:@"bird5"]
                            ];
    bird.animationRepeatCount = -1; //forever loop
    bird.animationDuration = 1; //khoảng thời gian chạy animation
    [[self view] addSubview:bird];
    [bird startAnimating];
}
-(void)flyUpAndDown{
    bird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:5 animations:^{
        bird.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1), CGAffineTransformMakeRotation(M_PI_4));
        [UIView animateWithDuration:5 animations:^{
            bird.center = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            [self flyUpAndDown];
        }];
    }];
}

@end

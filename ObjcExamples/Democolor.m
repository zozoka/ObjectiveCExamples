//
//  Democolor.m
//  ObjcExamples
//
//  Created by thanh tung on 11/28/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "Democolor.h"
#import "UIColor+Extend.h"
@interface Democolor ()

@end

@implementation Democolor

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, 100, 40)];
    label.backgroundColor = [[UIColor alloc] initWithHex:@"#FA6900" alpha:1.0];
    [[self view] addSubview:label];
    
}


@end

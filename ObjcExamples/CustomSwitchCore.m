//
//  CustomSwitchCore.m
//  ObjcExamples
//
//  Created by thanh tung on 11/23/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "CustomSwitchCore.h"

@implementation CustomSwitchCore

{
    UIButton* _buttonON;
    UIButton* _buttonOFF;
}

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 132, 51)];
    _buttonON = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 66, 51)];
    _buttonOFF = [[UIButton alloc]initWithFrame:CGRectMake(66, 0, 66, 51)];
    [_buttonON addTarget:self action:@selector(pressON) forControlEvents:UIControlEventTouchUpInside];
    [_buttonOFF addTarget:self action:@selector(pressOFF) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_buttonON];
    [self addSubview:_buttonOFF];
    self.value = false;
    
    return self;
}

-(void) pressON{
    self.value = true;
}

-(void) pressOFF{
    self.value = false;
}

-(void) setValue:(BOOL)value{
    _value = value;
    if (_value) {
        [_buttonON setImage:[UIImage imageNamed:@"ON-white"] forState:UIControlStateNormal];
        [_buttonOFF setImage:[UIImage imageNamed:@"OFF-black"] forState:UIControlStateNormal];
    }else{
        [_buttonON setImage:[UIImage imageNamed:@"ON-black"] forState:UIControlStateNormal];
        [_buttonOFF setImage:[UIImage imageNamed:@"OFF-white"] forState:UIControlStateNormal];
    }
    [self sendActionsForControlEvents:UIControlEventValueChanged];

}
-(void) getValue{
    self.value = _value;
}

@end

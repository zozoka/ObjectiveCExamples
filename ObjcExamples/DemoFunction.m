//
//  DemoFunction.m
//  ObjcExamples
//
//  Created by thanh tung on 11/13/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "DemoFunction.h"

@interface DemoFunction ()

@end

@implementation DemoFunction

- (void)viewDidLoad {
    [super viewDidLoad];
    float tempDegree = 30.1;
    NSString* result = [NSString stringWithFormat:@"%2.1fC degree equal to %3.1fF", tempDegree, [self celciusToFahrenheit:tempDegree]];
    [self writeln:result];
    [self performSelector:@selector(sayFirstName:andLastName:) withObject:@"Tech" withObject:@"Master"];
    //[self performSelector:@selector() withObject:<#(id)#>
    // @(30.1) == [NSNumber alloc] initWithFloat:30.1
    [self performSelector:@selector(celciusToFahrenheit2:) withObject:@(30.1)];
}

- (void) sayFirstName: (NSString*) firsName andLastName: (NSString*) lastName{
    NSLog(@"%@ %@", firsName, lastName);
}

-(float) celciusToFahrenheit: (float) degree{
    return degree*1.8 + 32.0;
}
-(void) celciusToFahrenheit{
    NSLog(@"Do nothing");
}
-(float) celciusToFahrenheit2{
    return 10.1;
}
-(void) celciusToFahrenheit2: (NSNumber*) degree{
    float result = [degree floatValue] * 1.8 + 32.0;
    NSLog(@"Result = %2.1f", result);
}
@end

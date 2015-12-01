//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"Demo Funtion", CLASS: @"DemoFunction"},
                                    @{TITLE: @"Selector", CLASS: @"DemoSelector"}
                          ]};
    NSDictionary* intermediate = @{SECTION: @"UIView", MENU: @[
                                    @{TITLE: @"Demo Slider", CLASS: @"DemoSlider"},
                                    @{TITLE: @"Slider Advance", CLASS: @"CustomerSlider"},
                                    @{TITLE: @"Customized Switch", CLASS: @"CustomSwitch"},
                                    @{TITLE: @"Drop Ball", CLASS: @"DropBall"},
                                    @{TITLE: @"Nghịch Ngọc Trinh", CLASS: @"SkewImage"},
                                    @{TITLE: @"Calculator", CLASS: @"Calculator"},
                                    @{TITLE: @"UIView Basic", CLASS: @"UIViewBasic"},
                                    @{TITLE: @"Chess View", CLASS: @"ChessView"},
                                    @{TITLE: @"Lửa Trại", CLASS: @"CampFire"},
                                    @{TITLE: @"Flying bird", CLASS: @"FlyingBird"},
                                    @{TITLE: @"Trái đất và mặt trời", CLASS: @"EarthAndSun"},
                                    @{TITLE: @"Rolling Ball", CLASS: @"RollingBall"},
                                    @{TITLE: @"Hex Color", CLASS: @"Democolor"}
                                  ]};
    
    NSDictionary* advanced = @{SECTION: @"Advanced", MENU: @[
                                    @{TITLE: @"Advanced C", CLASS: @"AdvancedC"}
                             ]};
    
    mainScreen.menu = @[basic, intermediate, advanced];
    mainScreen.title = @"Objective-C by Examples";
    mainScreen.about = @"This is demo of Objective-C languages by Thanh Tung - Techmaster";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
    
}
@end

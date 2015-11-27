//
//  Calculator.m
//  ObjcExamples
//
//  Created by thanh tung on 11/24/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "Calculator.h"

@interface Calculator ()

@end

@implementation Calculator
{
    UIView* viewCalulator;
    UILabel* laberResult;
    UIButton* buttonEqual; // dau bang
    UIButton* buttonDot; // dau cham
    UIButton* buttonMultiply; // nhan
    UIButton* buttonDivide; // chia
    UIButton* buttonPlus; // cong
    UIButton* buttonMinus; // tru
    UIButton* buttonNegative; // so am
    UIButton* buttonPercent; // %
    UIButton* buttonC;
    UIButton* button0;
    UIButton* button1;
    UIButton* button2;
    UIButton* button3;
    UIButton* button4;
    UIButton* button5;
    UIButton* button6;
    UIButton* button7;
    UIButton* button8;
    UIButton* button9;
    UILabel* labelResult;
    float currentValue;
    float withViewBout;
    float heightViewBout;
    NSString* temp;
    NSString* operand;
    BOOL isFirst;
    BOOL calculated;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    operand = @"";
    temp = @"0";
    currentValue = 0.0;
    calculated = false;
    isFirst = true;
    self.view.backgroundColor = [UIColor blackColor];
    withViewBout = self.view.bounds.size.width;
    heightViewBout = self.view.bounds.size.height;
 
    
    /// add button Equal
    buttonEqual = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.25*withViewBout)+0.5, heightViewBout-(0.25*withViewBout)+0.5, (0.25*withViewBout)-0.5, (0.25*withViewBout-0.5))];
    [buttonEqual setTitle:@"=" forState:UIControlStateNormal];
    buttonEqual.titleLabel.font = [UIFont systemFontOfSize:42];
    buttonEqual.backgroundColor = [UIColor orangeColor];
 
    //buttonEqual.layer.borderWidth = 1.0f;
    //buttonEqual.layer.borderColor = [[UIColor blackColor] CGColor];
    [[self view]addSubview:buttonEqual];
    [buttonEqual addTarget:self action:@selector(pressEqual) forControlEvents:UIControlEventTouchUpInside];

    
    /// add button Dot
    buttonDot = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.5*withViewBout)+0.25, heightViewBout-(0.25*withViewBout)+0.5, (0.25*withViewBout)-0.5, (0.25*withViewBout-0.5))];
    [buttonDot setTitle:@"." forState:UIControlStateNormal];
    buttonDot.titleLabel.font = [UIFont systemFontOfSize:42];
    buttonDot.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:buttonDot];
    [buttonDot addTarget:self action:@selector(pressDecimal) forControlEvents:UIControlEventTouchUpInside];
    
    // add button 0
    button0 = [[UIButton alloc]initWithFrame:CGRectMake(0.0, heightViewBout-(0.25*withViewBout)+0.5, 0.5*withViewBout-1, 0.25*withViewBout-0.5)];
    [button0 setTitle:@"0" forState:UIControlStateNormal];
    button0.titleLabel.font = [UIFont systemFontOfSize:42];
    button0.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:button0];
    [button0 addTarget:self action:@selector(pressNumbers:) forControlEvents:UIControlEventTouchUpInside];
    
    // add button +
    buttonPlus = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.25*withViewBout)+0.5, heightViewBout-(0.5*withViewBout)+0.5, (0.25*withViewBout)-0.5, (0.25*withViewBout-1))];
    [buttonPlus setTitle:@"+" forState:UIControlStateNormal];
    buttonPlus.titleLabel.font = [UIFont systemFontOfSize:42];
    buttonPlus.backgroundColor = [UIColor orangeColor];
    [[self view]addSubview:buttonPlus];
    [buttonPlus addTarget:self action:@selector(pressCalculator:) forControlEvents:UIControlEventTouchUpInside];
    
    /// add button 3
    button3 = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.5*withViewBout)+0.25, heightViewBout-(0.5*withViewBout)+0.5, (0.25*withViewBout)-0.5, (0.25*withViewBout-1))];
    [button3 setTitle:@"3" forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:42];
    button3.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:button3];
    [button3 addTarget:self action:@selector(pressNumbers:) forControlEvents:UIControlEventTouchUpInside];
    
    /// add button 2
    button2 = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.75*withViewBout)-0.25, heightViewBout-(0.5*withViewBout)+0.5, (0.25*withViewBout)-0.5, (0.25*withViewBout-1))];
    [button2 setTitle:@"2" forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:42];
    button2.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:button2];
    [button2 addTarget:self action:@selector(pressNumbers:) forControlEvents:UIControlEventTouchUpInside];
    
    /// add button 1
    button1 = [[UIButton alloc]initWithFrame:CGRectMake(0.0, heightViewBout-(0.5*withViewBout)+0.5, (0.25*withViewBout)-1.5, (0.25*withViewBout-1))];
    [button1 setTitle:@"1" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:42];
    button1.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:button1];
    [button1 addTarget:self action:@selector(pressNumbers:) forControlEvents:UIControlEventTouchUpInside];
    
    // add button -
    buttonMinus = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.25*withViewBout)+0.5, heightViewBout-(0.75*withViewBout), (0.25*withViewBout)-0.5, (0.25*withViewBout-0.5))];
    [buttonMinus setTitle:@"-" forState:UIControlStateNormal];
    buttonMinus.titleLabel.font = [UIFont systemFontOfSize:42];
    buttonMinus.backgroundColor = [UIColor orangeColor];
    [[self view]addSubview:buttonMinus];
    [buttonMinus addTarget:self action:@selector(pressCalculator:) forControlEvents:UIControlEventTouchUpInside];
    
    /// add button 6
    button6 = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.5*withViewBout)+0.25, heightViewBout-(0.75*withViewBout), (0.25*withViewBout)-0.5, (0.25*withViewBout-0.5))];
    [button6 setTitle:@"6" forState:UIControlStateNormal];
    button6.titleLabel.font = [UIFont systemFontOfSize:42];
    button6.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:button6];
    [button6 addTarget:self action:@selector(pressNumbers:) forControlEvents:UIControlEventTouchUpInside];
    
    /// add button 5
    button5 = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.75*withViewBout)-0.25, heightViewBout-(0.75*withViewBout), (0.25*withViewBout)-0.5, (0.25*withViewBout-0.5))];
    [button5 setTitle:@"5" forState:UIControlStateNormal];
    button5.titleLabel.font = [UIFont systemFontOfSize:42];
    button5.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:button5];
    [button5 addTarget:self action:@selector(pressNumbers:) forControlEvents:UIControlEventTouchUpInside];
    
    /// add button 4
    button4 = [[UIButton alloc]initWithFrame:CGRectMake(0.0, heightViewBout-(0.75*withViewBout), (0.25*withViewBout)-1.5, (0.25*withViewBout-0.5))];
    [button4 setTitle:@"4" forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont systemFontOfSize:42];
    button4.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:button4];
    [button4 addTarget:self action:@selector(pressNumbers:) forControlEvents:UIControlEventTouchUpInside];
    
    // add button X
    buttonMultiply = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.25*withViewBout)+0.5, heightViewBout-withViewBout-0.5, (0.25*withViewBout)-0.5, (0.25*withViewBout-0.5))];
    [buttonMultiply setTitle:@"x" forState:UIControlStateNormal];
    buttonMultiply.titleLabel.font = [UIFont systemFontOfSize:42];
    buttonMultiply.backgroundColor = [UIColor orangeColor];
    [[self view]addSubview:buttonMultiply];
    [buttonMultiply addTarget:self action:@selector(pressCalculator:) forControlEvents:UIControlEventTouchUpInside];
    
    /// add button 9
    button9 = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.5*withViewBout)+0.25, heightViewBout-withViewBout-0.5, (0.25*withViewBout)-0.5, (0.25*withViewBout-0.5))];
    [button9 setTitle:@"9" forState:UIControlStateNormal];
    button9.titleLabel.font = [UIFont systemFontOfSize:42];
    button9.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:button9];
    [button9 addTarget:self action:@selector(pressNumbers:) forControlEvents:UIControlEventTouchUpInside];
    
    /// add button 8
    button8 = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.75*withViewBout)-0.25, heightViewBout-withViewBout-0.5, (0.25*withViewBout)-0.5, (0.25*withViewBout-0.5))];
    [button8 setTitle:@"8" forState:UIControlStateNormal];
    button8.titleLabel.font = [UIFont systemFontOfSize:42];
    button8.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:button8];
    [button8 addTarget:self action:@selector(pressNumbers:) forControlEvents:UIControlEventTouchUpInside];
    
    /// add button 7
    button7 = [[UIButton alloc]initWithFrame:CGRectMake(0.0, heightViewBout-withViewBout-0.5, (0.25*withViewBout)-1.5, (0.25*withViewBout-0.5))];
    [button7 setTitle:@"7" forState:UIControlStateNormal];
    button7.titleLabel.font = [UIFont systemFontOfSize:42];
    button7.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:button7];
    [button7 addTarget:self action:@selector(pressNumbers:) forControlEvents:UIControlEventTouchUpInside];
    
    // add button Divide
    buttonDivide = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.25*withViewBout)+0.5, heightViewBout-withViewBout*1.25-1, (0.25*withViewBout)-0.5, (0.25*withViewBout-0.5))];
    [buttonDivide setTitle:@":" forState:UIControlStateNormal];
    buttonDivide.titleLabel.font = [UIFont systemFontOfSize:42];
    buttonDivide.backgroundColor = [UIColor orangeColor];
    [[self view]addSubview:buttonDivide];
    [buttonDivide addTarget:self action:@selector(pressCalculator:) forControlEvents:UIControlEventTouchUpInside];
    
    /// add button percent
    buttonPercent = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.5*withViewBout)+0.25, heightViewBout-withViewBout*1.25-1, (0.25*withViewBout)-0.5, (0.25*withViewBout-0.5))];
    [buttonPercent setTitle:@"%" forState:UIControlStateNormal];
    buttonPercent.titleLabel.font = [UIFont systemFontOfSize:30];
    buttonPercent.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:buttonPercent];
    [buttonPercent addTarget:self action:@selector(pressCalculator:) forControlEvents:UIControlEventTouchUpInside];
    
    /// add button Negative
    buttonNegative = [[UIButton alloc]initWithFrame:CGRectMake(withViewBout-(0.75*withViewBout)-0.25, heightViewBout-withViewBout*1.25-1, (0.25*withViewBout)-0.5, (0.25*withViewBout-0.5))];
    [buttonNegative setTitle:@"+/_" forState:UIControlStateNormal];
    buttonNegative.titleLabel.font = [UIFont systemFontOfSize:30];
    buttonNegative.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:buttonNegative];
    [buttonNegative addTarget:self action:@selector(pressNegative) forControlEvents:UIControlEventTouchUpInside];
    
    /// add button c
    buttonC = [[UIButton alloc]initWithFrame:CGRectMake(0.0, heightViewBout-withViewBout*1.25-1, (0.25*withViewBout)-1.5, (0.25*withViewBout-0.5))];
    [buttonC setTitle:@"C" forState:UIControlStateNormal];
    buttonC.titleLabel.font = [UIFont systemFontOfSize:42];
    buttonC.backgroundColor = [UIColor grayColor];
    [[self view]addSubview:buttonC];
    [buttonC addTarget:self action:@selector(pressClear) forControlEvents:UIControlEventTouchUpInside];
    
    labelResult =[[UILabel alloc]initWithFrame:CGRectMake(0.0, heightViewBout-withViewBout*1.5-7, withViewBout, 0.25*heightViewBout)];
    labelResult.text = temp;
    labelResult.textColor = [UIColor whiteColor];
    labelResult.font = [UIFont systemFontOfSize:42];
    labelResult.textAlignment  = NSTextAlignmentRight;
    [[self view]addSubview:labelResult];

}



-(BOOL) doesStringContainDecimal:(NSString*) string{
    NSString* search = @".";
    NSRange range = [string rangeOfString:search];
    if (range.location == NSNotFound) {
        return false;
    }else{
        return true;
    }
}

-(void) pressNegative{ // so am
    
}

-(void) pressNumbers:(UIButton*) sender{
    if (calculated) {
        labelResult.text = @"";
        calculated = false;
    }
    NSString* number = sender.titleLabel.text;
    
    if ([labelResult.text doubleValue] == 0 && ![self doesStringContainDecimal:labelResult.text]) {
        labelResult.text = @"";
    }
    labelResult.text = [labelResult.text stringByAppendingString:number];
    temp = labelResult.text;
}

-(void) pressEqual{
    NSLog(@"=");
    NSLog(@"%@",operand);
    [self calculator];
    operand =@"";
    currentValue = [temp doubleValue];
}

-(void) calculator{
    //temp = labelResult.text;
    
        if ([operand isEqual:@"+"]) {
            NSLog(@"%@",operand);
            currentValue = currentValue + [temp doubleValue];
            temp = @"0";
        }else if ([operand isEqual:@"-"]){
            NSLog(@"%@",operand);
            currentValue = currentValue - [temp doubleValue];
            temp = @"0";
            
        }else if([operand isEqual:@"x"]){
            NSLog(@"%@",operand);
            if (currentValue!=0) {
                currentValue = currentValue * [temp doubleValue];
            }else{
                currentValue = [temp doubleValue];
            }
            temp = @"0";
            
        }else if([operand isEqual:@":"]){
            NSLog(@"%@",operand);
            if (currentValue ==0) {
                [self pressClear];
            }else{
                currentValue = currentValue / [temp doubleValue];
                temp = @"0";
            }
            
        }
    
    labelResult.text = [NSString stringWithFormat:@"%g",currentValue];
    calculated = true;
}

-(void) pressCalculator:(UIButton*) sender{
    operand = sender.titleLabel.text;
    if(operand.length != 0){
        
    }
    if (isFirst) {
        currentValue = [temp doubleValue];
        isFirst = false;
        calculated = true;
    }else{
        [self calculator];
    }
    //NSLog(@"%f",currentValue);
    
}

-(void) pressClear{
    temp = @"0";
    labelResult.text = @"0";
    isFirst = true;
    currentValue = 0.0;
    operand = @"";
}

-(void)pressDecimal{
    
    if (![self doesStringContainDecimal:labelResult.text]) {
        temp = [temp stringByAppendingString:@"."];
        labelResult.text = temp;
    }
}

@end

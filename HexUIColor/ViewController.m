//
//  ViewController.m
//  HexUIColor
//
//  Created by Rene Alejandro Basurto Quijada on 07/03/14.
//  Copyright (c) 2014 Rene A Basurto Q. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *coloredView;
@property (weak, nonatomic) IBOutlet UITextField *hexColorLabel;

@end

@implementation ViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



- (IBAction)processButton:(id)sender
{
    unsigned result = 0;
    NSString *hexString = [NSString stringWithFormat: @"%@",self.hexColorLabel.text];
    
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&result];
    
    unsigned rr = ((result >> 16) & 0xFF);
    unsigned gg = ((result >> 8) & 0xFF);
    unsigned bb = ((result >> 0) & 0xFF);
    
    [self.coloredView setBackgroundColor:[UIColor colorWithRed:((float)rr)/255.0
                                                         green:((float)gg)/255.0
                                                          blue:((float)bb)/255.0
                                                         alpha:1.0]];
}


@end

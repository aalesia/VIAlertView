//
//  VIViewController.m
//  AlertBlocks
//
//  Created by Anthony Alesia on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VIViewController.h"
#import "VIAlertView.h"

@interface VIViewController ()

@end

@implementation VIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)pressedAlert:(id)sender 
{
    [[[VIAlertView alloc] initWithCompletion:^(VIAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"tapped index: %d", buttonIndex);
    } 
                                      title:@"Alert" 
                                    message:@"Test Message"
                                   delegate:self 
                          cancelButtonTitle:@"No"
                          otherButtonTitles:@"Yes", @"Maybe", nil] show];
}

@end

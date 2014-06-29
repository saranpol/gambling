//
//  GBViewController.m
//  Gambling
//
//  Created by saranpol on 6/28/2557 BE.
//  Copyright (c) 2557 hlpth. All rights reserved.
//

#import "GBViewController.h"


@implementation GBViewController

@synthesize mYouHave;
@synthesize mYouBet;
@synthesize mSlider;
@synthesize mLabelYouHave;
@synthesize mLabelYouBet;
@synthesize mLabelWin;
@synthesize mLabelLose;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mYouHave = 10000;

    [self updateYouHave];
    [self updateYouBet];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateYouHave {
    [mLabelYouHave setText:[NSString stringWithFormat:@"$%ld", (long)mYouHave]];
}

- (void)updateYouBet {
    self.mYouBet = fabs(mSlider.value * mYouHave);
    [mLabelYouBet setText:[NSString stringWithFormat:@"$%ld", (long)mYouBet]];
}




- (IBAction)sliderChange:(id)sender {
    [self updateYouBet];
}

- (void)randomWin {
    if(arc4random()%2){
        // win
        self.mYouHave += mYouBet;
        [mLabelWin setAlpha:1];
        [UIView animateWithDuration:2.0 animations:^{
            [mLabelWin setAlpha:0];
        }];
    }else{
        // lose
        self.mYouHave -= mYouBet;
        [mLabelLose setAlpha:1];
        [UIView animateWithDuration:2.0 animations:^{
            [mLabelLose setAlpha:0];
        }];
    }
    [self updateYouHave];
    [self updateYouBet];
}

- (IBAction)clickA:(id)sender {
    [self randomWin];
}

- (IBAction)clickB:(id)sender {
    [self randomWin];
}


@end

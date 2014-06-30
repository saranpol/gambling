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
@synthesize mInterval;
@synthesize mLabelYouHave;
@synthesize mLabelYouBet;
@synthesize mLabelWin;
@synthesize mLabelLose;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mYouHave = 100000;
    self.mYouBet = 100;

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
    //self.mYouBet = fabs(mSlider.value * mYouHave);
    if(mYouBet >= mYouHave)
        self.mYouBet = mYouHave;
    [mLabelYouBet setText:[NSString stringWithFormat:@"$%ld", (long)mYouBet]];
}



- (void)randomWin {
    if(arc4random()%2){
        // win
        self.mYouHave += mYouBet;
        [mLabelWin setHidden:NO];
        [mLabelLose setHidden:YES];
        [mLabelWin setAlpha:1];
        [UIView animateWithDuration:2.0 animations:^{
            [mLabelWin setAlpha:0];
        }];
//        self.mYouBet = 100;
    }else{
        // lose
        self.mYouHave -= mYouBet;
        [mLabelWin setHidden:YES];
        [mLabelLose setHidden:NO];
        [mLabelLose setAlpha:1];
        [UIView animateWithDuration:2.0 animations:^{
            [mLabelLose setAlpha:0];
        }];
//        self.mYouBet *= 2;
//        if(mYouBet >= mYouHave)
//            self.mYouBet = mYouHave;
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

- (void)minusBet {
    if(mInterval >= 0.1)
        self.mYouBet--;
    else
        self.mYouBet -= 1.0/mInterval;
    if(mYouBet <= 0)
        self.mYouBet = 0;
    [self updateYouBet];
    [self performSelector:@selector(minusBet) withObject:nil afterDelay:mInterval];
    self.mInterval /= 1.2;
    if(mInterval <= 0.005)
        mInterval = 0.005;
}

- (void)plusBet {
    if(mInterval >= 0.1)
        self.mYouBet++;
    else
        self.mYouBet += 1.0/mInterval;
    if(mYouBet >= mYouHave)
        self.mYouBet = mYouHave;
    [self updateYouBet];
    [self performSelector:@selector(plusBet) withObject:nil afterDelay:mInterval];
    self.mInterval /= 1.2;
    if(mInterval <= 0.005)
        mInterval = 0.005;
}


- (IBAction)downMinus:(id)sender {
    self.mInterval = 0.2;
    [self minusBet];
}


- (IBAction)downPlus:(id)sender {
    self.mInterval = 0.2;
    [self plusBet];
}

- (void)d2 {
    self.mYouBet /= 2.0;
    if(mYouBet <= 0)
        self.mYouBet = 0;
    if(mYouBet >= mYouHave)
        self.mYouBet = mYouHave;
    [self updateYouBet];
    [self performSelector:@selector(d2) withObject:nil afterDelay:mInterval];
}

- (void)x2 {
    self.mYouBet *= 2.0;
    if(mYouBet >= mYouHave)
        self.mYouBet = mYouHave;
    [self updateYouBet];
    [self performSelector:@selector(x2) withObject:nil afterDelay:mInterval];
}


- (IBAction)clickD2:(id)sender {
    self.mInterval = 0.2;
    [self d2];
}

- (IBAction)clickX2:(id)sender {
    self.mInterval = 0.2;
    [self x2];
}

- (IBAction)anyUp:(id)sender {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}



@end

//
//  GBViewController.h
//  Gambling
//
//  Created by saranpol on 6/28/2557 BE.
//  Copyright (c) 2557 hlpth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBViewController : UIViewController


@property (nonatomic, assign) NSInteger mYouHave;
@property (nonatomic, assign) NSInteger mYouBet;
@property (nonatomic, weak) IBOutlet UISlider *mSlider;
@property (nonatomic, weak) IBOutlet UILabel *mLabelYouHave;
@property (nonatomic, weak) IBOutlet UILabel *mLabelYouBet;
@property (nonatomic, weak) IBOutlet UILabel *mLabelWin;
@property (nonatomic, weak) IBOutlet UILabel *mLabelLose;


- (IBAction)sliderChange:(id)sender;
- (IBAction)clickA:(id)sender;
- (IBAction)clickB:(id)sender;

@end

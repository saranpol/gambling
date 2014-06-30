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
@property (nonatomic, assign) NSTimeInterval mInterval;
@property (nonatomic, weak) IBOutlet UILabel *mLabelYouHave;
@property (nonatomic, weak) IBOutlet UILabel *mLabelYouBet;
@property (nonatomic, weak) IBOutlet UILabel *mLabelWin;
@property (nonatomic, weak) IBOutlet UILabel *mLabelLose;


- (IBAction)clickA:(id)sender;
- (IBAction)clickB:(id)sender;
- (IBAction)downMinus:(id)sender;
- (IBAction)downPlus:(id)sender;
- (IBAction)clickD2:(id)sender;
- (IBAction)clickX2:(id)sender;
- (IBAction)anyUp:(id)sender;

@end

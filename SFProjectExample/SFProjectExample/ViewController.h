//
//  ViewController.h
//  SFProjectExample
//
//  Created by Simon Fortelny on 4/14/13.
//  Copyright (c) 2013 Simon Fortelny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) IBOutlet UIButton *topBtn;
@property (nonatomic,strong) IBOutlet UIButton *bottomBtn;
@property (nonatomic,strong) IBOutlet UIButton *leftBtn;
@property (nonatomic,strong) IBOutlet UIButton *rightBtn;
@property (nonatomic,strong) IBOutlet UIButton *leftDiagnalBtn;
@property (nonatomic,strong) IBOutlet UIButton *rightDiagnalBtn;

@property (nonatomic,strong) IBOutlet UILabel *label;

@property (nonatomic,strong) IBOutlet UIView *viewToRotate;

-(IBAction)buttonPressed:(id)sender;

@end

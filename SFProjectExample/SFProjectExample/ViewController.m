//
//  ViewController.m
//  SFProjectExample
//
//  Created by Simon Fortelny on 4/14/13.
//  Copyright (c) 2013 Simon Fortelny. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Transform3D.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)buttonPressed:(id)sender{
  kRotationAround rotationType;
  if(sender==self.topBtn){
    rotationType=kRotationAroundTopEdge;
  }else if(sender==self.bottomBtn){
    rotationType=kRotationAroundBottomEdge;
  }else if(sender==self.leftBtn){
    rotationType=kRotationAroundLeftEdge;
  }else{
    rotationType=kRotationAroundRightEdge;
  }
  
  self.topBtn.enabled=NO;
  self.bottomBtn.enabled=NO;
  self.leftBtn.enabled=NO;
  self.rightBtn.enabled=NO;
  [self.viewToRotate rotate:rotationType degrees:180 duration:1 delay:0 completion:^{
    self.topBtn.enabled=YES;
    self.bottomBtn.enabled=YES;
    self.leftBtn.enabled=YES;
    self.rightBtn.enabled=YES;
  }];
}

@end

//
//  UIView+Transform3D.m
//
// Copyright 2013 Simon Fortelny
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "UIView+Transform3D.h"
#import <QuartzCore/QuartzCore.h>

#define ToRad(deg) 		( (M_PI * (deg)) / 180.0 )

@implementation UIView (Transform3D)

-(void)rotate:(kRotationAround)rotationType degrees:(float)degrees duration:(float)duration delay:(float)delay completion:(void (^)(void))completion{
  //capture orig anchor so we can restore it after the animation
  CGPoint origAnchor = self.layer.anchorPoint;
  
  [self updateAnchorAndCenterFor:rotationType];
  
  [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
    //don't want to translate so set the views transform to 0 translation
    self.transform = CGAffineTransformMakeTranslation(0,0);
    self.layer.transform =[self transformFor:rotationType degrees:degrees];
  } completion:^(BOOL finished) {
    /*
     * Return the anchorPoint to its original value
     * and adjust the center to account for the change
     */
    int newX =self.center.x + (self.bounds.size.width*(self.layer.anchorPoint.x-origAnchor.x));
    int newY =self.center.y + (self.bounds.size.height*(self.layer.anchorPoint.y-origAnchor.y));
    self.center = CGPointMake(newX,newY);
    self.layer.anchorPoint = origAnchor;
    
    if(completion){
      completion();
    }
  }];
  
}


/*
 * Create 3D transform
 */
-(CATransform3D)transformFor:(kRotationAround)rotationType degrees:(float)degrees {
  CATransform3D transform = CATransform3DIdentity;
  switch (rotationType) {
    case kRotationAroundLeftEdge:
      transform =CATransform3DMakeRotation(ToRad(degrees),0.0f,1.0f,0.0f);
      break;
    case kRotationAroundRightEdge:
      transform =CATransform3DMakeRotation(ToRad(degrees),0.0f,1.0f,0.0f);
      break;
    case kRotationAroundTopEdge:
      transform =CATransform3DMakeRotation(ToRad(degrees),1.0f,0.0f,0.0f);
      break;
    case kRotationAroundBottomEdge:
      transform =CATransform3DMakeRotation(ToRad(degrees),1.0f,0.0f,0.0f);
      break;
    case kRotationAroundCenterAlongXAxis:
      transform =CATransform3DMakeRotation(ToRad(degrees),1.0f,0.0f,0.0f);
      break;
    case kRotationAroundCenterAlongYAxis:
      transform =CATransform3DMakeRotation(ToRad(degrees),0.0f,1.0f,0.0f);
      break;
    default:
      break;
  }
  transform.m34 = 0.001f;
  return transform;
}

/*
 * Set the new anchor and update the center since changing the anchor will update the center
 *
 */
-(void)updateAnchorAndCenterFor:(kRotationAround)rotationType {
  switch (rotationType) {
    case kRotationAroundLeftEdge:
      self.layer.anchorPoint= CGPointMake(0, .5);
      self.center = CGPointMake(self.center.x - self.bounds.size.width/2.0f, self.center.y);
      break;
    case kRotationAroundRightEdge:
      self.layer.anchorPoint= CGPointMake(1, .5);
      self.center = CGPointMake(self.center.x + self.bounds.size.width/2.0f, self.center.y);
      break;
    case kRotationAroundTopEdge:
      self.layer.anchorPoint= CGPointMake(0.5, 0);
      self.center = CGPointMake(self.center.x , self.center.y- self.bounds.size.height/2.0f);
      break;
    case kRotationAroundBottomEdge:
      self.layer.anchorPoint= CGPointMake(0.5, 1);
      self.center = CGPointMake(self.center.x, self.center.y+ self.bounds.size.height/2.0f);
      break;
    case kRotationAroundCenterAlongXAxis:
      self.layer.anchorPoint= CGPointMake(0.5, .5);
      self.center = CGPointMake(self.center.x, self.center.y);
      break;
    case kRotationAroundCenterAlongYAxis:
      self.layer.anchorPoint= CGPointMake(0.5, .5);
      self.center = CGPointMake(self.center.x, self.center.y);
      break;
    default:
      break;
  }
}

@end

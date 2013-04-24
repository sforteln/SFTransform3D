//
//  UIView+SFTransforms3D.h
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

#import <UIKit/UIKit.h>

typedef enum {
  kRotationAroundLeftEdge,
  kRotationAroundRightEdge,
  kRotationAroundTopEdge,
  kRotationAroundBottomEdge,
  kRotationAroundCenterAlongXAxis,
  kRotationAroundCenterAlongYAxis,
  kRotationAroundCenterAlongDiagonalFromUpperLeft,
  kRotationAroundCenterAlongDiagonalFromUpperRight,
  
} kRotationAround;

@interface UIView (SFTransform3D)


-(void)rotate:(kRotationAround)rotationAround degrees:(float)degrees duration:(float)duration delay:(float)delay completion:(void (^)(void))completion;

@end

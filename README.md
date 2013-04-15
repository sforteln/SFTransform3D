## About
====
SFTransform3D is an iOS category on UIView that simplifies applyinf some 3D transormations to the UIView.

## Usage
====
import the category  
 `#import "UIView+Transform3D.h"`  
call the method on the UIView you want to rotate  
 `[self.viewToRotate rotate:rotationAround  
                  degrees:180 duration:1 delay:0 completion:^{NSLog(@"Done!");}];`  

### Rotation options
An enum of rotation options can be found in `UIView+Transform3D.h`. Currently these options are suported  
+ kRotationAroundLeftEdge  
+ kRotationAroundRightEdge  
+ kRotationAroundTopEdge  
+ kRotationAroundBottomEdge  
+ kRotationAroundCenterAlongXAxis  
+ kRotationAroundCenterAlongYAxis  
  
As suggested by the names each enum defines the edge of the view around which the rotation will occur. 
Or in the case of the two 'center' options the axis the view will be rotated about at its center.

## Installation
====
## Manual
* Copy the header and message files(`UIView+Transform3D.{h,m}`) for the category into you project
* Add the `QuartzCore.framework` to the `Link binaries with Libraries` section of your projects build targets `Build Phases` 

### In progress
adding the library to cocoapods.

## License
====
Copyright 2013 Simon Fortelny  
Apache 2.0 see LICENSE.md for full text

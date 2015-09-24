//
//  ViewController.h
//  CCamera
//
//  Created by Yakir Narkis on 9/21/15.
//  Copyright © 2015 Yakir Narkis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraViewController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) CameraViewController* overlay;

- (void)imageCaptured:(UIImage *)image;
@end


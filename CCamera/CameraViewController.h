//
//  CameraViewController.h
//  CCamera
//
//  Created by Yakir Narkis on 9/21/15.
//  Copyright © 2015 Yakir Narkis. All rights reserved.
//

#import <UIKit/UIKit.h>

// We can't import the ViewController class because it would make a circular reference, so "fake" the existence of the class like this:
@class ViewController;

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImagePickerController* picker;
@property (strong, nonatomic) ViewController* mainController;

@end

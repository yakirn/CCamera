//
//  Camera2ViewController.h
//  CCamera
//
//  Created by Yakir Narkis on 9/21/15.
//  Copyright © 2015 Yakir Narkis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Camera2ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImagePickerController* picker;
@property (strong, nonatomic) UIViewController* mainController;

@end

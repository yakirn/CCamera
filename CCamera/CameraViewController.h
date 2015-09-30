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
@property (nonatomic, assign) BOOL gridState;
@property (weak, nonatomic) ViewController* mainController;
@property (weak, nonatomic) IBOutlet UIView* buttonsPanel;
@property (weak, nonatomic) IBOutlet UIImageView* takenImageView;
@property (weak, nonatomic) IBOutlet UIButton *takePhotoButton;
@property (weak, nonatomic) IBOutlet UIButton *takeAnotherPhoto;
@property (weak, nonatomic) IBOutlet UIView *squarePlaceholderView;

-(IBAction) takePhoto:(id)sender forEvent:(UIEvent*)event;
-(IBAction) takeAnotherPhoto:(id)sender forEvent:(UIEvent*)event;

-(IBAction) toggleCameraGrid:(id)sender forEvent:(UIEvent*)event;

-(void) presentImage: (UIImage*) image;
-(void) clearPresentaion;
-(void) imageSelected;

@end

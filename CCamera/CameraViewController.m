//
//  CameraViewController.m
//  CCamera
//
//  Created by Yakir Narkis on 9/21/15.
//  Copyright © 2015 Yakir Narkis. All rights reserved.
//

#import "CameraViewController.h"
#import "ViewController.h"
#import "UIImage+UIImageCropAdditions.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.takenImageView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera ]) {
        // Instantiate the UIImagePickerController instance
        self.picker = [[UIImagePickerController alloc] init];

        // Configure the UIImagePickerController instance
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        self.picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        self.picker.showsCameraControls = NO;
        
        // Make us the delegate for the UIImagePickerController
        self.picker.delegate = self;
        
        // Set the frames to be full screen
        CGRect screenFrame = [[UIScreen mainScreen] bounds];
        self.view.frame = screenFrame;
        self.picker.view.frame = screenFrame;
        
        self.squarePlaceholderView.hidden = YES;
        
        // Set this VC's view as the overlay view for the UIImagePickerController
        self.picker.cameraOverlayView = self.view;
    }
    return self;
}

-(IBAction) takePhoto:(id)sender forEvent:(UIEvent*)event {
    // Call the takePicture method on the UIImagePickerController to capture the image.
    [self.picker takePicture];
}

-(IBAction) takeAnotherPhoto:(id)sender forEvent:(UIEvent*)event {
    [self clearPresentaion];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);

    // Show image
    [self presentImage: image];
}

-(IBAction) toggleCameraGrid:(id)sender forEvent:(UIEvent*)event {
    self.takeAnotherPhoto.selected = !self.takeAnotherPhoto.selected;
    
    //TODO: draw/hide grid
}

-(void) presentImage: (UIImage*) image{
    // showing image view
    self.takenImageView.image = image;
    self.takenImageView.hidden = NO;
    
//    self.picker.view.hidden = YES;
//    self.picker.cameraOverlayView.hidden = NO;
    
    // changing to approve button
    [self.takePhotoButton setImage: [UIImage imageNamed:@"SnapApprove"] forState:UIControlStateNormal];
    [self.takePhotoButton setImage: nil forState:UIControlStateHighlighted];
    [self.takePhotoButton removeTarget:self action:@selector(takePhoto:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.takePhotoButton addTarget:self action:@selector(imageSelected) forControlEvents:UIControlEventTouchUpInside];
    
    // changing to take another button
    [self.takeAnotherPhoto setImage:[UIImage imageNamed:@"cameraaftergrid"] forState:UIControlStateNormal];
    self.gridState = self.takeAnotherPhoto.selected;
    self.takeAnotherPhoto.selected = NO;
    [self.takeAnotherPhoto removeTarget:self action:@selector(toggleCameraGrid:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.takeAnotherPhoto addTarget:self action:@selector(takeAnotherPhoto:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void) clearPresentaion{
    //Hiding image view
    self.takenImageView.image = nil;
    self.takenImageView.hidden = YES;
    
    self.picker.view.hidden = NO;
    
    // changing to approve button
    [self.takePhotoButton setImage: [UIImage imageNamed:@"SnapImage"] forState:UIControlStateNormal];
    [self.takePhotoButton setImage: [UIImage imageNamed:@"SnapImgeClicked"] forState:UIControlStateHighlighted];
    [self.takePhotoButton removeTarget:self action:@selector(imageSelected) forControlEvents:UIControlEventTouchUpInside];
    [self.takePhotoButton addTarget:self action:@selector(takePhoto:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    // changing to toggle grid button
    [self.takeAnotherPhoto setImage:[UIImage imageNamed:@"gridsmallclicked"] forState:UIControlStateNormal];
    self.takeAnotherPhoto.selected = self.gridState;
    [self.takeAnotherPhoto removeTarget:self action:@selector(takeAnotherPhoto:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.takeAnotherPhoto addTarget:self action:@selector(toggleCameraGrid:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void) imageSelected {
    UIImage* originalImage = self.takenImageView.image;
    CGRect viewRect = self.squarePlaceholderView.frame;
    double ratio = originalImage.size.width / viewRect.size.width;
    
    // Crop image to square
    CGRect croprect = CGRectMake(0, viewRect.origin.y * ratio, originalImage.size.width, originalImage.size.width);
    UIImage* squareImage = [self.takenImageView.image croppedImageInRect: croprect];
    
    if(self.mainController != nil)
        [self.mainController imageCaptured: squareImage];

    UIImageWriteToSavedPhotosAlbum(self.takenImageView.image, nil, nil, nil);
    UIImageWriteToSavedPhotosAlbum(squareImage, nil, nil, nil);
}

//    UIImageWriteToSavedPhotosAlbum(squareImage, nil, nil, nil);
    
//    if(self.mainController != nil)
//        [self.mainController imageCaptured: squareImage];
    
    // Get a file path to save the JPEG
//    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString* documentsDirectory = [paths objectAtIndex:0];
//    NSString* filename = @"test.jpg";
//    NSString* imagePath = [documentsDirectory stringByAppendingPathComponent:filename];
//    
//    // Get the image data (blocking; around 1 second)
//    NSData* imageData = UIImageJPEGRepresentation(image, 0.5);
//
//    
//    // Write the data to the file
//    [imageData writeToFile:imagePath atomically:YES];
//    
//    // Tell the plugin class that we're finished processing the image
//    [self.plugin capturedImageWithPath:imagePath];

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

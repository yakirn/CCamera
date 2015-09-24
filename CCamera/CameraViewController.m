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
        
        // Set this VC's view as the overlay view for the UIImagePickerController
        self.picker.cameraOverlayView = self.view;
    }
    return self;
}

// Action method.  This is like an event callback in JavaScript.
-(IBAction) takePhotoButtonPressed:(id)sender forEvent:(UIEvent*)event {
    // Call the takePicture method on the UIImagePickerController to capture the image.
    [self.picker takePicture];
}

// Delegate method.  UIImagePickerController will call this method as soon as the image captured above is ready to be processed.  This is also like an event callback in JavaScript.
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
//    // Create square from top of current image
    CGRect croprect = CGRectMake(0, 0, image.size.width, image.size.width);
//
//    // Draw new image in current graphics context
//    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], croprect);
//    
//    // Create new cropped UIImage
//    UIImage *squareImage = [UIImage imageWithCGImage:imageRef scale:1.0 orientation:image.imageOrientation];
//    
//    CGImageRelease(imageRef);
    
    UIImage* squareImage = [image croppedImageInRect: croprect];
    UIImageWriteToSavedPhotosAlbum(squareImage, nil, nil, nil);
    
    if(self.mainController != nil)
        [self.mainController imageCaptured: squareImage];
    
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
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

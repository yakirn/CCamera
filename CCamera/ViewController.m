//
//  ViewController.m
//  CCamera
//
//  Created by Yakir Narkis on 9/21/15.
//  Copyright © 2015 Yakir Narkis. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.overlay = [[CameraViewController alloc] initWithNibName:@"CameraViewController" bundle:nil];
    self.overlay.mainController = self;
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    if(self.overlay.picker != nil)
        [self presentViewController:self.overlay.picker animated:YES completion:nil];
    else
        [self presentViewController:self.overlay animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imageCaptured:(UIImage *)image{
    [self dismissViewControllerAnimated:YES completion:NULL];
    [self.imageView setImage:image];
}

@end

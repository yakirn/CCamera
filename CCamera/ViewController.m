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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) buttonHandler:(id)sender {
    self.overlay = [[Camera2ViewController alloc] initWithNibName:@"Camera2ViewController" bundle:nil];
    self.overlay.mainController = self;
    
    [self presentViewController:self.overlay.picker animated:YES completion:nil];
}

- (void)imageCaptured:(UIImage *)image{
    [self dismissViewControllerAnimated:YES completion:NULL];
    [self.imageView setImage:image];
}

@end

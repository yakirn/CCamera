//
//  ViewController.h
//  CCamera
//
//  Created by Yakir Narkis on 9/21/15.
//  Copyright © 2015 Yakir Narkis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Camera2ViewController.h"

@interface ViewController : UIViewController

- (IBAction) buttonHandler:(id)sender;

@property (strong, nonatomic) Camera2ViewController* overlay;
@end


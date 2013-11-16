//
//  DetailViewController.h
//  MedAppJam
//
//  Created by Ethan Wessel on 11/8/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIWebViewPlayer.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UIView *viewContainer;
@property (strong, nonatomic) IBOutlet UIWebView *player;
@property (strong, nonatomic) IBOutlet UISegmentedControl *tabControl;
@property (strong, nonatomic) IBOutlet UIView *comments;
@property (strong, nonatomic) IBOutlet UIView *quiz;


@end

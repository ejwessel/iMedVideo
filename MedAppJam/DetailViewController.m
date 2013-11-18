//
//  DetailViewController.m
//  MedAppJam
//
//  Created by Ethan Wessel on 11/8/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView{
    // Update the user interface for the detail item.
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name: UIKeyboardDidShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidHide:) name: UIKeyboardDidHideNotification object:nil];
    
    //self.player.hidden = true;
    //self.player.scrollView.scrollEnabled = false;
    self.player.scrollView.bounces = false;
    self.comments.hidden = true;
    self.quiz.hidden = true;
    
    self.addCommentButton.hidden = true;
    [self.addCommentButton setTitle:@"Add Comment" forState:UIControlStateNormal];
    [self.addCommentButton.layer setBorderWidth:1];
    [self.addCommentButton.layer setCornerRadius:10];
    [self.addCommentButton addTarget:self action:@selector(grabText) forControlEvents:UIControlEventTouchUpInside];
    
    self.tabControl.hidden = true;
    [self.tabControl addTarget:self action:@selector(changeView) forControlEvents:UIControlEventValueChanged];
    
    [self configureView];
}

- (void)grabText{
    self.commentGrabber = [[UIAlertView alloc] initWithTitle:@""
                                                     message:@""
                                                    delegate:self
                                           cancelButtonTitle:@"Cancel"
                                           otherButtonTitles:@"Submit", nil];
    
    self.commentGrabber.alertViewStyle = UIAlertViewStylePlainTextInput;
    [self.commentGrabber show];

}

- (void)changeView{
    NSLog(@"tab touched");
    if(self.tabControl.selectedSegmentIndex == 0){
        self.comments.hidden = false;
        self.quiz.hidden = true;
        self.addCommentButton.hidden = false; //
        //load comments here...
        
    }
    else if(self.tabControl.selectedSegmentIndex == 1){
        self.quiz.hidden = false;
        self.comments.hidden = true;
        self.addCommentButton.hidden = true; //
        //load quiz here...
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)keyboardDidShow:(NSNotification *)notification{
//    NSLog(@"keyboard show");
//    
//    self.commentGrabber = [[UIAlertView alloc] initWithTitle:@""
//                                                     message:@""
//                                                    delegate:self
//                                           cancelButtonTitle:@"Cancel"
//                                           otherButtonTitles:@"Submit", nil];
//    
//    self.commentGrabber.alertViewStyle = UIAlertViewStylePlainTextInput;
//    [self.commentGrabber setFrame:CGRectMake(0, 0, 400, 400)];
//    [self.commentGrabber show];
//}
//
//- (void)keyboardDidHide:(NSNotification *)notification{
//    NSLog(@"keyboard hidden");
//}


#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end

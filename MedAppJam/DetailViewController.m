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
    
    [self setupComment];
    
    self.player.scrollView.bounces = false;
    self.comments.hidden = true;
    self.quiz.hidden = true;
    
    self.commentField.hidden = true;
    self.commentField.textColor = self.tabControl.tintColor;
//    self.addCommentButton.hidden = true;
//    [self.addCommentButton setTitle:@"Add Comment" forState:UIControlStateNormal];
//    [self.addCommentButton.layer setBorderWidth:1];
//    [self.addCommentButton.layer setCornerRadius:10];
//    [self.addCommentButton addTarget:self action:@selector(grabText) forControlEvents:UIControlEventTouchUpInside];
    
    self.tabControl.hidden = true;
    [self.tabControl addTarget:self action:@selector(changeView) forControlEvents:UIControlEventValueChanged];
    
    [self configureView];
}

- (void)grabText{
//    self.commentGrabber = [[UIAlertView alloc] initWithTitle:@"Add Comment"
//                                                     message:@""
//                                                    delegate:self
//                                           cancelButtonTitle:@"Cancel"
//                                           otherButtonTitles:@"Submit", nil];
//    
//    //self.commentGrabber.alertViewStyle = UIAlertViewStylePlainTextInput;
//    [self.commentGrabber setFrame:CGRectMake(0, 0, 500, 500)];
//    
//    //= CGRectMake(self.commentGrabber.frame.origin.x, self.commentGrabber.frame.origin.x, 400, 400);
//
//    [self.commentGrabber show];
}

- (void)changeView{
    NSLog(@"tab touched");
    if(self.tabControl.selectedSegmentIndex == 0){
        self.quiz.hidden = false;
        self.comments.hidden = true;
        self.commentField.hidden = true;
    }
    else if(self.tabControl.selectedSegmentIndex == 1){
        self.comments.hidden = false;
        self.quiz.hidden = true;
        self.commentField.hidden = false;
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupComment{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(open)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    self.accView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 45)];
    self.t = [[UITextField alloc] initWithFrame:CGRectMake(320, 0, 620, 45)];
    self.t.backgroundColor = [UIColor greenColor];

    // Create object with size
    self.submitButton = [[UIButton alloc] initWithFrame:CGRectMake(940, 0, 80, 45)];
    
    self.submitButton.backgroundColor = [UIColor blueColor];
    [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    
    [self.accView addSubview:self.t];
    [self.accView addSubview:self.submitButton];
    
    // Add functionality to button
    [self.submitButton addTarget:self
                          action:@selector(submit)
                forControlEvents:UIControlEventTouchUpInside];
    
    //self.commentField.clearsOnBeginEditing = true;
    self.commentField.inputAccessoryView = self.accView;
}

- (void) submit{
    NSLog(@"submitButtonClicked");
    
    // Save to Inject_Insulin.txt
    //if(submitButtonClicked){
    NSString *addedText = self.t.text; // Text from text field
    NSString *strPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    strPath = [strPath stringByAppendingPathComponent:@"Inject_Insulin.txt"];
    [addedText writeToFile:strPath
            atomically:NO
              encoding:NSStringEncodingConversionAllowLossy
                     error:nil];
    //}
}
- (void)open{
    [self.t becomeFirstResponder]; //will return TRUE;
}

- (void)hide{
    self.commentField.text = @"Add Comment";
}

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

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
    
    [self copyTxtFilesToDocuments];
    
    [self configureView];
}

- (void)copyTxtFilesToDocuments{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    //obtain all bundle files
    NSString * resourcePath = [[NSBundle mainBundle] resourcePath];
    
    //obtain all text files
    NSArray *extensions = [[NSArray alloc] initWithObjects:@"txt", nil];
    NSArray *txtFiles = [[[NSFileManager defaultManager] contentsOfDirectoryAtPath:resourcePath error:&error] pathsMatchingExtensions:extensions];
    
    //copy files form bundle to documents folder
    for (NSString *s in txtFiles) {
        NSString *itemAtPath = [[resourcePath stringByAppendingString:@"/"] stringByAppendingString:s];
        NSString *itemToPath = [[documentsDirectory stringByAppendingString:@"/"] stringByAppendingString:s];
        [fileManager copyItemAtPath:itemAtPath toPath:itemToPath error:&error];
    }
    
    //NSArray *txtFilesCopied = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&error];
    //ALL TEXT FILES ARE COPIED into Documents directory
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

- (void)submit{
    NSLog(@"submitButtonClicked");
    
    // Here you set your text.
    //assume everybody is a patient at first
    NSString *yourAppendingText = [[NSString alloc] initWithFormat:@"\n1:P:%@", self.t.text];
    
    // Here you get access to the file in Documents directory of your application bundle.
    NSString *documentDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //need file name
    NSString *documentFile = [documentDir stringByAppendingPathComponent:@"Diet.txt"];
    
    // Here you read current existing text from that file
    NSString *textFromFile = [NSString stringWithContentsOfFile:documentFile encoding:NSUTF8StringEncoding error:nil];
    
    // Here you append new text to the existing one if it is
    if(textFromFile){
        NSLog(@"appending");
        NSString *textToFile = [textFromFile stringByAppendingString:[NSString stringWithFormat:@"%@",yourAppendingText]];
        
        // Here you save the updated text to that file
        [textToFile writeToFile:documentFile
                     atomically:YES
                       encoding:NSUTF8StringEncoding
                          error:nil];
        
        NSLog(@"%@", textToFile);
    }
 
//    CommentObject *prevObject = comments.commentObjects.lastObject;//[comments.commentObjects objectAtIndex:comments.commentObjects.count - 1];
//    updatePos = (updatePos + prevObject.bounds.size.height + 5);
//    frame = CGRectMake(commentXPos, updatePos, comments.bounds.size.width - commentXPos, commentHeight);
//    //need to add to commentView list of objects

    
    CommentObject *lastObject = self.comments.commentObjects.lastObject;
    CGRect frame = CGRectMake(lastObject.frame.origin.x, lastObject.frame.size.height + lastObject.frame.origin.y + 5, lastObject.frame.size.width, lastObject.frame.size.height);
    CommentObject *newObject = [[CommentObject alloc] initWithFrame:frame withString:self.t.text withIsDoctor:false];
    
    [self.comments.commentObjects addObject:newObject];
    [self.comments addCommentsToView];
    
    //clear any previous text placed
    self.t.text = @"";
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

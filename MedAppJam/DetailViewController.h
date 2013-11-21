//
//  DetailViewController.h
//  MedAppJam
//
//  Created by Ethan Wessel on 11/8/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIWebViewPlayer.h"
#import "CommentsView.h"
#import "CommentObject.h"
#import "QuizView.h"
#import "QuizObject.h"
#import "AddCommentView.h"
#import "FileContentLoader.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UITextViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UIView *viewContainer;
@property (strong, nonatomic) IBOutlet UIWebView *player;
@property (strong, nonatomic) IBOutlet UISegmentedControl *tabControl;
@property (strong, nonatomic) IBOutlet CommentsView *comments;
@property (strong, nonatomic) IBOutlet QuizView *quiz;
//@property (strong, nonatomic) IBOutlet AddCommentView *addCommentView;
//@property (strong, nonatomic) IBOutlet UIButton *addCommentButton;
//@property (strong, nonatomic) UIAlertView *commentGrabber;
@property (strong, nonatomic) UIView *accView;
@property (strong, nonatomic) UITextField *t;

@property (strong, nonatomic) IBOutlet UITextField *commentField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *accountButton;

// Takes text from Comment and submit
@property(nonatomic, readonly) UIButtonType UIButtonTypeCustom;
@property (strong, nonatomic) UIButton *submitButton;
@property (strong, nonatomic) NSString *tableLastClickedName;

@end

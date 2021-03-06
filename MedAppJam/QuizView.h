//
//  QuizView.h
//  MedAppJam
//
//  Created by Ethan Wessel on 11/16/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizObject.h"
@interface QuizView : UIView

@property (strong, nonatomic) NSMutableArray *quizData;
@property (strong, nonatomic) NSMutableArray *answerChosen;
@property (strong, nonatomic) IBOutlet UIButton *reviewButton;
@property BOOL quizFinished;
@property BOOL reviewFinished;
@property (strong, nonatomic) IBOutlet UILabel *question;
@property (strong, nonatomic) IBOutlet UILabel *correctIncorrectLabel;

@property (strong, nonatomic) IBOutlet UIButton *option1;
@property (strong, nonatomic) IBOutlet UIButton *option2;
@property (strong, nonatomic) IBOutlet UIButton *option3;
@property (strong, nonatomic) IBOutlet UIButton *option4;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UIButton *videoAns;

@property (strong, nonatomic) IBOutlet UITextView *explanation;
@property (strong, nonatomic) IBOutlet UILabel *scoringText;
@property (strong, nonatomic) IBOutlet UILabel *quizScore;
@property (strong, nonatomic) IBOutlet UILabel *quizPosition;

@property (strong, nonatomic) NSString *correctAnswer;

@property (strong, nonatomic) NSString *videoTime;
@property (strong, nonatomic) IBOutlet UIWebView *player;
@property (strong, nonatomic) NSString *link;

@property int currentIndex;
@property int totalOptions;

@property int totalQuestions;
@property int totalCorrect;

- (void)addInitialQuizView;

@end

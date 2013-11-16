//
//  QuizView.h
//  MedAppJam
//
//  Created by Ethan Wessel on 11/16/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizView : UIView

@property (strong, nonatomic) NSMutableArray *quizData;
@property (strong, nonatomic) UILabel *question;
@property (strong, nonatomic) UIButton *option1;
@property (strong, nonatomic) UIButton *option2;
@property (strong, nonatomic) UIButton *option3;
@property (strong, nonatomic) UIButton *option4;

@property int totalQuestions;
@property int totalCorrect;

@end

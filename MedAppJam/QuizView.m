//
//  QuizView.m
//  MedAppJam
//
//  Created by Ethan Wessel on 11/16/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import "QuizView.h"

@implementation QuizView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
-(void)addInitialQuizView{
    
    self.backgroundColor = [UIColor clearColor];
    self.correctIncorrectLabel.hidden = true;
    [self.correctIncorrectLabel.layer setCornerRadius:20];
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [self loadDataFromIndex:0]; //load from 0 initally
    
    [self.option1.layer setCornerRadius:5];
    [self.option1.layer setBorderWidth:1];
    [self.option2.layer setCornerRadius:5];
    [self.option2.layer setBorderWidth:1];
    [self.option3.layer setCornerRadius:5];
    [self.option3.layer setBorderWidth:1];
    [self.option4.layer setCornerRadius:5];
    [self.option4.layer setBorderWidth:1];
    [self.nextButton.layer setCornerRadius:5];
    [self.nextButton.layer setBorderWidth:1];
}

- (void)button1Clicked{
    
    NSLog(@"Answer 1 pressed");
    if ([self isCorrect:@"A"]){
        //true explain
        NSLog(@"correct!");
        self.correctIncorrectLabel.backgroundColor = [UIColor greenColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"CORRECT!";
    }
    else{
        //false explain
        NSLog(@"incorrect!");
        self.correctIncorrectLabel.backgroundColor = [UIColor redColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"Incorrect";
    }
}
- (void)button2Clicked{
    
    NSLog(@"Answer 2 pressed");
    if ([self isCorrect:@"B"]){
        //true explain
        NSLog(@"correct!");
        self.correctIncorrectLabel.backgroundColor = [UIColor greenColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"CORRECT!";
    }
    else{
        //false explain
        NSLog(@"incorrect!");
        self.correctIncorrectLabel.backgroundColor = [UIColor redColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"Incorrect";
    }
}
- (void)button3Clicked{
    
    NSLog(@"Answer 3 pressed");
    if ([self isCorrect:@"C"]){
        //true explain
        NSLog(@"correct!");
        self.correctIncorrectLabel.backgroundColor = [UIColor greenColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"CORRECT!";
    }
    else{
        //false explain
        NSLog(@"incorrect!");
        self.correctIncorrectLabel.backgroundColor = [UIColor redColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"Incorrect";
    }
}
- (void)button4Clicked{
    
    NSLog(@"Answer 4 pressed");
    if ([self isCorrect:@"D"]){
        //true explain
        NSLog(@"correct!");
        self.correctIncorrectLabel.backgroundColor = [UIColor greenColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"CORRECT!";
    }
    else{
        //false explain
        NSLog(@"incorrect!");
        self.correctIncorrectLabel.backgroundColor = [UIColor redColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"Incorrect";
    }
}

- (void)nextQuestion{
    
}

- (void)loadDataFromIndex:(int) i{
    QuizObject *q = [self.quizData objectAtIndex:0];
    
    [self.question setText:q.question];
    self.correctAnswer = q.correctOption;
    [self.option1 setTitle:q.option1 forState:UIControlStateNormal];
    [self.option2 setTitle:q.option2 forState:UIControlStateNormal];
    [self.option3 setTitle:q.option3 forState:UIControlStateNormal];
    [self.option4 setTitle:q.option4 forState:UIControlStateNormal];
    
    [self.option1 addTarget:self
                     action:@selector(button1Clicked)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.option2 addTarget:self
                     action:@selector(button2Clicked)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.option3 addTarget:self
                     action:@selector(button3Clicked)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.option4 addTarget:self
                     action:@selector(button4Clicked)
           forControlEvents:UIControlEventTouchUpInside];
}

- (BOOL)isCorrect:(NSString *)s{
    if([s isEqualToString:self.correctAnswer]){
        return true;
    }
    return false;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

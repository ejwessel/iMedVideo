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

- (void)setupInitial{
    self.backgroundColor = [UIColor clearColor];
    self.totalQuestions = self.quizData.count;
    self.correctIncorrectLabel.hidden = true;
    self.explanation.hidden = true;
    
    self.scoringText.hidden = true;
    self.scoringText.text = @"Score:";
    
    self.quizScore.hidden = true;
    
    self.question.font = [self.question.font fontWithSize:15];
    self.question.adjustsFontSizeToFitWidth = true;
    
    [self.correctIncorrectLabel.layer setCornerRadius:20];
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    
    //set up desired look of buttons
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
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.reviewButton.layer setCornerRadius:5];
    [self.reviewButton.layer setBorderWidth:1];
}

- (void)addInitialQuizView{
    
    //clear any previous quiz that was being taken
    [self resetQuiz];
    
    [self setupInitial];
    
    [self updateQuizPositionLabel];     //tells us what question we are on.

    [self loadDataFromIndex:self.currentIndex];
    
    //setup answer choices to all skipped.
    self.answerChosen = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.totalQuestions; i++) {
        [self.answerChosen addObject:@"N"];
    }
    
    [self resetQuizView];       //need this here because it adjusts view accordingly
}

- (void)button1Clicked{
    
    self.option1.backgroundColor = self.tintColor;
    [self.option1 setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    
    [self.answerChosen replaceObjectAtIndex:self.currentIndex withObject:@"A"];
    
    NSLog(@"Answer 1 pressed");
    if ([self isCorrect:@"A"]){
        //true explain
        NSLog(@"correct!");
        self.correctIncorrectLabel.backgroundColor = [UIColor greenColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"CORRECT!";
        self.totalCorrect++;
    }
    else{
        //false explain
        NSLog(@"incorrect!");
        self.correctIncorrectLabel.backgroundColor = [UIColor redColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"Incorrect";
    }
    [self questionAnswered];
}

- (void)button2Clicked{
    
    self.option2.backgroundColor = self.tintColor;
    [self.option2 setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    
    [self.answerChosen replaceObjectAtIndex:self.currentIndex withObject:@"B"];
    
    NSLog(@"Answer 2 pressed");
    if ([self isCorrect:@"B"]){
        //true explain
        NSLog(@"correct!");
        self.correctIncorrectLabel.backgroundColor = [UIColor greenColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"CORRECT!";
        self.totalCorrect++;
    }
    else{
        //false explain
        NSLog(@"incorrect!");
        self.correctIncorrectLabel.backgroundColor = [UIColor redColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"Incorrect";
    }
    [self questionAnswered];
}

- (void)button3Clicked{
    
    self.option3.backgroundColor = self.tintColor;
    [self.option3 setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    
    [self.answerChosen replaceObjectAtIndex:self.currentIndex withObject:@"C"];
    
    NSLog(@"Answer 3 pressed");
    if ([self isCorrect:@"C"]){
        //true explain
        NSLog(@"correct!");
        self.correctIncorrectLabel.backgroundColor = [UIColor greenColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"CORRECT!";
        self.totalCorrect++;
    }
    else{
        //false explain
        NSLog(@"incorrect!");
        self.correctIncorrectLabel.backgroundColor = [UIColor redColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"Incorrect";
    }
    [self questionAnswered];
}

- (void)button4Clicked{
    
    self.option4.backgroundColor = self.tintColor;
    [self.option4 setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    
    [self.answerChosen replaceObjectAtIndex:self.currentIndex withObject:@"D"];
    
    NSLog(@"Answer 4 pressed");
    if ([self isCorrect:@"D"]){
        //true explain
        NSLog(@"correct!");
        self.correctIncorrectLabel.backgroundColor = [UIColor greenColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"CORRECT!";
        self.totalCorrect++;
    }
    else{
        //false explain
        NSLog(@"incorrect!");
        self.correctIncorrectLabel.backgroundColor = [UIColor redColor];
        self.correctIncorrectLabel.hidden = false;
        self.correctIncorrectLabel.text = @"Incorrect";
    }
    [self questionAnswered];
}

- (void)questionAnswered{
    self.option1.enabled = false;
    self.option2.enabled = false;
    self.option3.enabled = false;
    self.option4.enabled = false;
    self.explanation.hidden = false;
}

- (void)nextQuestion{
    
    self.currentIndex++;
    
    //the quiz is finished
    if(self.currentIndex >= self.quizData.count){
        
        NSLog(@"No more questions");
        NSLog(@"Answers: %@", self.answerChosen);
        self.question.hidden = true;
        self.option1.hidden = true;
        self.option2.hidden = true;
        self.option3.hidden = true;
        self.option4.hidden = true;
        self.nextButton.hidden = true;
        self.correctIncorrectLabel.hidden = true;
        self.explanation.hidden = true;
        
        self.scoringText.hidden = false;
        self.quizScore.hidden = false;
        
        NSString *s = [[NSString alloc] initWithFormat:@"%d / %d", self.totalCorrect, self.totalQuestions];
        [self.quizScore setText:s];
        
        NSLog(@"%d / %d", self.totalCorrect, self.totalQuestions);

        //self.totalCorrect = 0;
        
        self.quizFinished = true;
        self.reviewButton.hidden = false;
        self.reviewFinished = false;
        self.currentIndex = 0;
        //send message to doctor and save results to account?
    }
    else if(self.quizFinished){
        [self reviewButtonClicked];
    }
    else{
        //load next question
        [self updateQuizPositionLabel];
        [self loadDataFromIndex:self.currentIndex];
        [self resetQuizView];
    }
}

- (void)reviewButtonClicked{
    NSLog(@"quiz ended, review in progress");
    [self setupReviewView];
    
}

- (void)setupReviewView{
    self.scoringText.hidden = true;
    self.quizScore.hidden = true;
    self.reviewButton.hidden = true;
    
    //reset quiz position and show first quiz
    [self loadDataFromIndex:self.currentIndex];
    
    //display review
    [self resetQuizView];
    
    //check here and hide accordingly
    NSString *chosen = [self.answerChosen objectAtIndex:self.currentIndex];
    QuizObject *q = [self.quizData objectAtIndex:self.currentIndex];
    NSString *realAnswer = q.correctOption;
    
    self.correctIncorrectLabel.hidden = false;
    //compare to show correct or incorrect
    if([chosen isEqualToString:realAnswer]){
        self.correctIncorrectLabel.backgroundColor = [UIColor greenColor];
        self.correctIncorrectLabel.text = @"CORRECT!";
    }
    else if([chosen isEqualToString:@"N"]){
        self.correctIncorrectLabel.backgroundColor = [UIColor lightGrayColor];
        self.correctIncorrectLabel.text = @"SKIPPED";
    }
    else{
        self.correctIncorrectLabel.backgroundColor = [UIColor redColor];
        self.correctIncorrectLabel.text = @"INCORRECT!";
    }
    
    //hide all other choices except chosen
    self.option1.enabled = false;
    self.option2.enabled = false;
    self.option3.enabled = false;
    self.option4.enabled = false;
    
    if([chosen isEqualToString:@"A"]){
        self.option1.backgroundColor = self.tintColor;
        [self.option1 setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    }
    else if ([chosen isEqualToString:@"B"]){
        self.option2.backgroundColor = self.tintColor;
        [self.option2 setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    }
    else if ([chosen isEqualToString:@"C"]){
        self.option3.backgroundColor = self.tintColor;
        [self.option3 setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    }
    else if ([chosen isEqualToString:@"D"]){
        self.option4.backgroundColor = self.tintColor;
        [self.option4 setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    }
    
    self.explanation.hidden = false;
    NSString *pos = [[NSString alloc] initWithFormat:@"%d of %d", self.currentIndex + 1, self.totalQuestions];
    self.quizPosition.text = pos;
}

- (void)updateQuizPositionLabel{
    int displayIndex = self.currentIndex + 1;
    NSLog(@"next button clicked, %d, %d", displayIndex, self.quizData.count);
    NSString *quizPositionText = [[NSString alloc] initWithFormat:@"%d of %d", displayIndex, self.quizData.count];
    [self.quizPosition setText:quizPositionText];

}

- (void)loadDataFromIndex:(int) i{
    QuizObject *q = [self.quizData objectAtIndex:i];
    
    [self.question setText:q.question];
    self.correctAnswer = q.correctOption;
    self.totalOptions = q.totalNumOptions;
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
    
    [self.nextButton addTarget:self
                    action:@selector(nextQuestion)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.reviewButton addTarget:self
                          action:@selector(reviewButtonClicked)
                forControlEvents:UIControlEventTouchUpInside];
    
    [self.explanation setText:q.explanationTxt];
}

- (BOOL)isCorrect:(NSString *)s{
    if([s isEqualToString:self.correctAnswer]){
        return true;
    }
    return false;
}

- (void)resetQuizView{
    
    //need to reset view
    self.question.hidden = false;   //show question
    self.option3.hidden = true;     //assume option 3 and option 4 are non existent initially
    self.option4.hidden = true;
    
    self.option1.hidden = false;
    self.option1.enabled = true;
    self.option1.backgroundColor = [UIColor clearColor];
    [self.option1 setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];

    self.option2.hidden = false;
    self.option2.enabled = true;
    self.option2.backgroundColor = [UIColor clearColor];
    [self.option2 setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    
    //will reset and show option 3 if number of options permit
    if(self.totalOptions > 2){
        self.option3.hidden = false;
        self.option3.enabled = true;
        self.option3.backgroundColor = [UIColor clearColor];
        [self.option3 setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    }
    
    //wil reset and show option 4 is number of options permit
    if(self.totalOptions > 3){
        self.option4.hidden = false;
        self.option4.enabled = true;
        self.option4.backgroundColor = [UIColor clearColor];
        [self.option4 setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    }
    self.reviewButton.hidden = true;
    self.nextButton.hidden = false;
    self.correctIncorrectLabel.hidden = true;
    self.explanation.hidden = true;
}

- (void)resetQuiz{
    NSLog(@"Quiz was reset");
    self.totalCorrect = 0;
    self.currentIndex = 0;
    self.quizFinished = false;
    [self resetQuizView];
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

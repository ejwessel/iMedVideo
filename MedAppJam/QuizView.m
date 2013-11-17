//
//  QuizView.m
//  MedAppJam
//
//  Created by Ethan Wessel on 11/16/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import "QuizView.h"

@implementation QuizView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)addInitialQuizView{
    self.backgroundColor = [UIColor clearColor];
    QuizObject *q = [self.quizData objectAtIndex:0];
    
    int yPos = 45;
    
    self.question = [[UILabel alloc] initWithFrame:CGRectMake(0, yPos*0, self.bounds.size.width, 40)];
    self.question.text =  q.question;
    
    self.option1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.option1.frame = CGRectMake(0, yPos*1, self.bounds.size.width/2, 40);
    [self.option1 setTitle:q.option1 forState:UIControlStateNormal];
    [self.option1 addTarget:self
                              action:@selector(buttonClicked)
                    forControlEvents:UIControlEventTouchUpInside];
    
    self.option2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.option2.frame = CGRectMake(0, yPos*2, self.bounds.size.width/2, 40);
    [self.option2 setTitle:q.option2 forState:UIControlStateNormal];
    [self.option2 addTarget:self
                     action:@selector(buttonClicked)
           forControlEvents:UIControlEventTouchUpInside];
    
    self.option3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.option3.frame = CGRectMake(0, yPos*3, self.bounds.size.width/2, 40);
    [self.option3 setTitle:q.option3 forState:UIControlStateNormal];
    [self.option3 addTarget:self
                     action:@selector(buttonClicked)
           forControlEvents:UIControlEventTouchUpInside];
    
    self.option4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.option4.frame = CGRectMake(0, yPos*4, self.bounds.size.width/2, 40);
    [self.option4 setTitle:q.option4 forState:UIControlStateNormal];
    [self.option4 addTarget:self
                     action:@selector(buttonClicked)
           forControlEvents:UIControlEventTouchUpInside];
    
    
    self.option1.backgroundColor = [UIColor lightGrayColor];
    self.option2.backgroundColor = [UIColor lightGrayColor];
    self.option3.backgroundColor = [UIColor lightGrayColor];
    self.option4.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:self.question];
    [self addSubview:self.option1];
    [self addSubview:self.option2];
    [self addSubview:self.option3];
    [self addSubview:self.option4];
    
    NSLog(@"%@", self.subviews);
    
    [self setNeedsDisplay];
}

- (void)buttonClicked{
    
    NSLog(@"Answer pressed");
//    if () {
//        <#statements#>
//    }
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

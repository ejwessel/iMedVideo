//
//  QuizObject.h
//  MedAppJam
//
//  Created by Ethan Wessel on 11/16/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizObject : NSObject

@property (strong, nonatomic) NSString *question;
@property (strong, nonatomic) NSString *option1;
@property (strong, nonatomic) NSString *option2;
@property (strong, nonatomic) NSString *option3;
@property (strong, nonatomic) NSString *option4;
@property (strong, nonatomic) NSString *correctOption;
@property int totalNumOptions;
@property (strong, nonatomic) NSString *explanationTxt;

@end

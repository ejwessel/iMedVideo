//
//  CommentObject.h
//  MedAppJam
//
//  Created by Ethan Wessel on 11/16/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentObject : UILabel

@property BOOL isDoctor;

- (id)initWithFrame:(CGRect)frame withString:(NSString *)text withIsDoctor:(BOOL)value;
@end

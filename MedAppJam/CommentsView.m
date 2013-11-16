//
//  CommentsView.m
//  MedAppJam
//
//  Created by Ethan Wessel on 11/16/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import "CommentsView.h"

@implementation CommentsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) addCommentsToView{
    
    self.contentSize = self.superview.bounds.size; //will need to be changed.
    
    self.backgroundColor = [UIColor clearColor];
    
    for (CommentObject *object in self.commentObjects) {
        object.hidden = false;
        
        //NEED TO SET UP ICONS FOR DOCTOR AND PATIENT
        if(object.isDoctor){
            object.backgroundColor = [UIColor cyanColor];
        }
        else{
            object.backgroundColor = [UIColor lightGrayColor];
        }
        [self addSubview:object];
    }
    
    //[self addSubview:v];
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//
//}


@end

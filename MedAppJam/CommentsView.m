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
    
    //set up scrollview content size by getting first and last element positions
    CommentObject *objectFirst = [self.commentObjects objectAtIndex:0];
    int height = objectFirst.bounds.size.height;
    self.contentSize = CGSizeMake(self.bounds.size.width, (height + 5) * self.commentObjects.count); //multiplier will need to be changed
    
    self.backgroundColor = [UIColor clearColor];
    for (CommentObject *object in self.commentObjects) {
        object.hidden = false;
        
        //If doctor add the Doctor Icon
        if(object.isDoctor){
            UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, object.frame.origin.y, 15, 15)];
            UIImage *image = [UIImage imageNamed:@"doctorIcon.jpg"];
            iconView.image = image;            
            [self addSubview:iconView];
        }
        //else if patient add the Patient Icon
        else{
            object.backgroundColor = [UIColor lightGrayColor];
        }
        [self addSubview:object];
    }
    
    NSLog(@"%@", self.commentObjects);
    
    [self setNeedsDisplay];
}

//- (void) removeFromSuperview{
//    
//}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//
//}


@end

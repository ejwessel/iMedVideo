//
//  CommentsView.h
//  MedAppJam
//
//  Created by Ethan Wessel on 11/16/13.
//  Copyright (c) 2013 test. All rights reserved.
//
//

#import <UIKit/UIKit.h>
#import "CommentObject.h"

@interface CommentsView : UIScrollView

@property (strong, nonatomic) NSMutableArray *commentObjects;
@property (nonatomic, retain) UIImage *image;

- (void) addCommentsToView;

@end

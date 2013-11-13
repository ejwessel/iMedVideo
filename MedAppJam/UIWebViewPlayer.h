//
//  UIWebViewPlayer.h
//  MedAppJam
//
//  Created by Ethan Wessel on 11/11/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface UIWebViewPlayer : UIWebView

@property (strong, nonatomic) MPMoviePlayerController *videoView;

- (void)embedVideo:(NSString*)url frame:(CGRect)frame;

@end

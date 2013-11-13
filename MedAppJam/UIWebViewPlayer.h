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
@property (strong, nonatomic) NSURL *url;

- (id)initWithFrame:(CGRect)frame withURL:(NSString*) urlString;

- (void)embedVideo:(NSString*)url frame:(CGRect)frame;

@end

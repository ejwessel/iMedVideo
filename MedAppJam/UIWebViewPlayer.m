//
//  UIWebViewPlayer.m
//  MedAppJam
//
//  Created by Ethan Wessel on 11/11/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import "UIWebViewPlayer.h"

@implementation UIWebViewPlayer

@synthesize videoView = _videoView;
@synthesize url = _url;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withURL:(NSString *)urlString{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.url = [[NSURL alloc] initWithString:urlString];
        self.videoView = [[MPMoviePlayerController alloc] initWithContentURL:self.url];
 
        //NEEDS more setup
        
        [self addSubview:self.videoView.view];
        
    }
    return self;
}

- (void)embedVideo:(NSString*)url frame:(CGRect)frame {
    NSString* embedHTML = @"\
    <html><head>\
    <style type=\"text/css\">\
    body {\
        background-color: transparent;\
    color: white;\
    }\
    </style>\
    </head><body style=\"margin:0\">\
    <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
    width=\"%0.0f\" height=\"%0.0f\"></embed>\
    </body></html>";
    NSURL *urlPath = [[NSURL alloc] initFileURLWithPath:url];
//    if(_videoView == nil) {
//        _videoView = [[UIWebView alloc] initWithFrame:frame];
//        [self addSubview:_videoView];
//    }
    //[_videoView loadHTMLString:html baseURL:nil];
    
    _videoView = [[MPMoviePlayerController alloc] initWithContentURL:urlPath];
    [_videoView prepareToPlay];
    [_videoView.view setFrame: self.bounds];
    [self addSubview:_videoView.view];
    //[player play];
    self.backgroundColor = [UIColor blackColor];
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

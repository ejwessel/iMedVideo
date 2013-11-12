//
//  UIWebViewPlayer.m
//  MedAppJam
//
//  Created by Ethan Wessel on 11/11/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import "UIWebViewPlayer.h"

@implementation UIWebViewPlayer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)embedVideo:(NSString *)url{
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
 
//    NSString* html = [NSString stringWithFormat:embedHTML, url, frame.size.width, frame.size.height];
//    if(videoView == nil) {
//        videoView = [[UIWebView alloc] initWithFrame:frame];
//        [self.view addSubview:videoView];
//    }
//    [videoView loadHTMLString:html baseURL:nil];
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

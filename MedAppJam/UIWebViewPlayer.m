//
//  UIWebViewPlayer.m
//  MedAppJam
//
//  Created by Ethan Wessel on 11/11/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import "UIWebViewPlayer.h"

@implementation UIWebViewPlayer

#pragma mark -
#pragma mark Initialization

- (UIWebViewPlayer *)initWithStringAsURL:(NSString *)urlString frame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self = [super init]) {
        // HTML to embed YouTube video
        NSString *youTubeVideoHTML = @"<html><head>\
        <body style=\"margin:0\">\
        <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
        width=\"%0.0f\" height=\"%0.0f\"></embed>\
        </body></html>";
        
        // Populate HTML with the URL and requested frame size
        NSString *html = [NSString stringWithFormat:youTubeVideoHTML, urlString, frame.size.width, frame.size.height];
        
        // Load the html into the webview
        [self loadHTMLString:html baseURL:nil];
    }
    return self;
}

#pragma mark -
#pragma mark Cleanup

@end
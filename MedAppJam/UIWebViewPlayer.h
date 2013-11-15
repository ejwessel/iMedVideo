//
//  UIWebViewPlayer.h
//  MedAppJam
//
//  Created by Ethan Wessel on 11/11/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebViewPlayer: UIWebView
{
}

- (UIWebViewPlayer *)initWithStringAsURL:(NSString *)urlString frame:(CGRect)frame;

@end
//
//  FileLoader.h
//  Tarantula IPAD
//
//  Created by Ethan Wessel on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.

//  Class Description:
//  loads a file from a path and saves the individual file lines into an array to be used later


#import <Foundation/Foundation.h>

@interface FileContentLoader : NSObject

@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSArray *lines;

- (id)initWithFileName:(NSString*)fileName;
@end

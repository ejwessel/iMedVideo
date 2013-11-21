//
//  FileLoader.m
//  Tarantula IPAD
//
//  Created by Ethan Wessel on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FileContentLoader.h"

@implementation FileContentLoader

- (id)initWithFileName:(NSString*)fileName{

    self = [super init];
    
    if(self){
        //break file name into name and type
        NSArray *chunks = [fileName componentsSeparatedByString:@"."];
        NSString *name = [chunks objectAtIndex:0];
        NSString *type = [chunks objectAtIndex:1];
        
        NSString *documentDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *txtPath = [[documentDir stringByAppendingString:@"/"] stringByAppendingString:fileName];
        
        self.path = [[NSBundle mainBundle] pathForResource:name ofType:type];
        NSString *content = [NSString stringWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil]; //obtains contents of file
    
        if(content == nil){
            NSLog(@"File was not loaded correctly");
            exit(0);
        }
        
        self.lines = [content componentsSeparatedByString:@"\n"]; //breaks lines into line by line
    }
    return self;
}
@end

//
//  SubMasterViewController.h
//  MedAppJam
//
//  Created by Ethan Wessel on 11/14/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "FileContentLoader.h"

@class DetailViewController;

@interface SubMasterViewController : MasterViewController
@property (strong, nonatomic) DetailViewController *detailViewController;
//@property (strong, nonatomic) NSMutableDictionary *urlList;
@property (strong, nonatomic) FileContentLoader *fileLoader;
@property (strong, nonatomic) NSString *linkExtension;
@end

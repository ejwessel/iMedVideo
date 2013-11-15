//
//  SubMasterViewController.m
//  MedAppJam
//
//  Created by Ethan Wessel on 11/14/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import "SubMasterViewController.h"

#import "DetailViewController.h"

@interface SubMasterViewController ()

@end

@implementation SubMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSDate *object = _objects[indexPath.row];
//    self.detailViewController.detailItem = object;
    
    //Obtain text of video that we'll be searching
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    UILabel *l = [[cell.contentView subviews] objectAtIndex:0];
    NSString *labelText = l.text;
    NSLog(@"%@", labelText);
    
    
    
    self.detailViewController.player.hidden = true;
    [self.detailViewController.player setNeedsDisplay];
    
    //LOAD VIDEO
    UIWebViewPlayer *video = [[UIWebViewPlayer alloc] initWithStringAsURL:@"http://youtu.be/5xniR1GN69U" frame:CGRectMake(200, 270, 120, 120)];
    
    [self.detailViewController.viewContainer addSubview:video];
    [self.detailViewController.viewContainer setNeedsDisplay];
    
    //LOAD COMMENTS
}
@end

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
    
    //setup the dictionary
    self.urlList = [[NSMutableDictionary alloc] init];
    [self.urlList setObject:@"BALLA" forKey:@"Appendix Surgery"];
    [self.urlList setObject:@"url" forKey:@"Gall Bladder Surgery"];
    [self.urlList setObject:@"url" forKey:@"Hernia Repair"];
    [self.urlList setObject:@"url" forKey:@"Ileostomy Bag Care"];
    [self.urlList setObject:@"url" forKey:@"Check Blood Sugar"];
    [self.urlList setObject:@"url" forKey:@"Diet"];
    [self.urlList setObject:@"PqgKFsK7f-Q" forKey:@"Inject Insulin"];
    [self.urlList setObject:@"url" forKey:@"Cast Care"];
    [self.urlList setObject:@"url" forKey:@"Hip Replacement"];
    [self.urlList setObject:@"url" forKey:@"Knee Replacement"];
    [self.urlList setObject:@"url" forKey:@"Cataracts"];
    [self.urlList setObject:@"url" forKey:@"Contacts"];
    [self.urlList setObject:@"url" forKey:@"Eye Drops"];
    [self.urlList setObject:@"url" forKey:@"Coronary Artery Bypass"];
    [self.urlList setObject:@"url" forKey:@"Coronary Catheterization"];
    [self.urlList setObject:@"url" forKey:@"Heart Failure"];
    [self.urlList setObject:@"url" forKey:@"Lung Removal Surgery / Lobectomy"];
    [self.urlList setObject:@"url" forKey:@"Pneumonia"];
    [self.urlList setObject:@"url" forKey:@"Breast Feeding"];
    [self.urlList setObject:@"url" forKey:@"Cesarian Section"];
    [self.urlList setObject:@"url" forKey:@"Uterus Removal/Hysterectomy"];
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
    
    //search in hash here...
    
    NSString *extension = [self.urlList objectForKey:labelText];
    int height = self.detailViewController.player.bounds.size.height;
    int width = self.detailViewController.player.bounds.size.width;
    NSString *embedHTML =[NSString stringWithFormat:@"\
                              <html><head>\
                              <style type=\"text/css\">\
                              body {\
                              background-color: transparent;\
                              color: blue;\
                              }\
                              </style>\
                              </head><body style=\"margin:0\">\
                              <iframe height=\"%d\" width=\"%d\" src=\"http://www.youtube.com/embed/%@\"></iframe>\
                              </body></html>", height, width, extension];
    [self.detailViewController.player loadHTMLString:embedHTML baseURL:nil];
    
    self.detailViewController.player.frame = CGRectMake(0, 0, self.detailViewController.player.bounds.size.height, self.detailViewController.player.bounds.size.width);
    [self.detailViewController.player sizeToFit];
    self.detailViewController.player.hidden = false;
    
    NSLog(@"size: %d, %d", height, width);

}
@end

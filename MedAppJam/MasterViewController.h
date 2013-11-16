//
//  MasterViewController.h
//  MedAppJam
//
//  Created by Ethan Wessel on 11/8/13.
//  Copyright (c) 2013 test. All rights reserved.
//

//ETHAN WESSEL

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <UIScrollViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchController;
@property (strong, nonatomic) NSMutableArray *tableData; //will contain all of the data
@property (strong, nonatomic) NSMutableArray *filterData; //filtere data to display
@property BOOL isFiltered;

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar;


@end

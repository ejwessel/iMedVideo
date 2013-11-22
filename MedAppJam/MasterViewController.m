//
//  MasterViewController.m
//  MedAppJam
//
//  Created by Ethan Wessel on 11/8/13.
//  Copyright (c) 2013 test. All rights reserved.
//

//Ethan Wessel
//HENRY

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib{
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//    
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    //self.searchBar.delegate = self;
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
//    self.allTableData = [[NSMutableArray alloc] init];
//    [self.allTableData addObject:@"Abdomen"];
//    [self.allTableData addObject:@"Diabetes"];
//    [self.allTableData addObject:@"Bones"];
//    [self.allTableData addObject:@"Eyes"];
//    [self.allTableData addObject:@"Heart"];
//    [self.allTableData addObject:@"Lungs"];
//    [self.allTableData addObject:@"Reproducitve"];
//
//    [self.allTableData addObject:@"Appendix Surgery"];
//    [self.allTableData addObject:@"Gall Bladdery Surgery"];
//    [self.allTableData addObject:@"Hernia Repair"];
//    [self.allTableData addObject:@"Ileostomy Bag Care"];
//    
//    [self.allTableData addObject:@"Check Blood Sugar"];
//    [self.allTableData addObject:@"Diet"];
//    [self.allTableData addObject:@"Iject Insulin"];
//    
//    [self.allTableData addObject:@"Cast Care"];
//    [self.allTableData addObject:@"Hip Replacement"];
//    [self.allTableData addObject:@"Knee Replacement"];
//    
//    [self.allTableData addObject:@"Cataracts"];
//    [self.allTableData addObject:@"Contacts"];
//    [self.allTableData addObject:@"Eyes Drops"];
//    
//    [self.allTableData addObject:@"Conary Artery Bypass"];
//    [self.allTableData addObject:@"Conary Catherization"];
//    [self.allTableData addObject:@"Heart Failure"];
//    
//    [self.allTableData addObject:@"Lung Removal Surgery/Lobectomy"];
//    [self.allTableData addObject:@"Pneumonia"];
//    
//    [self.allTableData addObject:@"Breast Feeding"];
//    [self.allTableData addObject:@"Cesarian Section"];
//    [self.allTableData addObject:@"Uterus Removal/Hysterectomy"];

}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller{
    [self.tableView reloadData];
}

#pragma mark - Table View
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    int rowCount;
//    if(self.isFiltered)
//        rowCount = self.filteredTableData.count;
//    else
//        rowCount = self.allTableData.count;
//    return rowCount;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil)
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    
//    NSString *s;
//    if(self.isFiltered)
//        s = [self.filteredTableData objectAtIndex:indexPath.row];
//    else
//        s = [self.allTableData objectAtIndex:indexPath.row];
//    
//    cell.textLabel.text = s;
//    
//    return cell;
//}
//
//- (void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text{
//    if(text.length == 0){
//        self.isFiltered = FALSE;
//    }
//    else{
//        self.isFiltered = true;
//        self.filteredTableData = [[NSMutableArray alloc] init];
//        
//        for (NSString *s in self.allTableData){
//            NSRange nameRange = [s rangeOfString:text options:NSCaseInsensitiveSearch];
//            if(nameRange.location != NSNotFound){
//                [self.filteredTableData addObject:s];
//            }
//        }
//    }
//    
//    [self.tableView reloadData];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDate *object = _objects[indexPath.row];
    self.detailViewController.detailItem = object;

    NSLog(@"clickled");

    self.detailViewController.comments.hidden = true;
    [self.detailViewController.comments setNeedsDisplay];
    
    //hide keyboard if masterview is clicked
    self.detailViewController.t.text = @"";
    [self.detailViewController.t resignFirstResponder];
    [self.detailViewController.commentField resignFirstResponder];

}


@end

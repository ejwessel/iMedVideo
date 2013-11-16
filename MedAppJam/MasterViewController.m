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

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//    
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    self.tableData = [[NSMutableArray alloc] init];
    [self.tableData addObject:@"Abdomen"];
    [self.tableData addObject:@"Diabetes"];
    [self.tableData addObject:@"Bones"];
    [self.tableData addObject:@"Eyes"];
    [self.tableData addObject:@"Heart"];
    [self.tableData addObject:@"Lungs"];
    [self.tableData addObject:@"Reproducitve"];
    
    [self.tableData addObject:@"Appendix Surgery"];
    [self.tableData addObject:@"Gall Bladdery Surgery"];
    [self.tableData addObject:@"Hernia Repair"];
    [self.tableData addObject:@"Ileostomy Bag Care"];
    
    [self.tableData addObject:@"Check Blood Sugar"];
    [self.tableData addObject:@"Diet"];
    [self.tableData addObject:@"Iject Insulin"];
    
    [self.tableData addObject:@"Cast Care"];
    [self.tableData addObject:@"Hip Replacement"];
    [self.tableData addObject:@"Knee Replacement"];
    
    [self.tableData addObject:@"Cataracts"];
    [self.tableData addObject:@"Contacts"];
    [self.tableData addObject:@"Eyes Drops"];
    
    [self.tableData addObject:@"Conary Artery Bypass"];
    [self.tableData addObject:@"Conary Catherization"];
    [self.tableData addObject:@"Heart Failure"];
    
    [self.tableData addObject:@"Lung Removal Surgery/Lobectomy"];
    [self.tableData addObject:@"Pneumonia"];
    
    [self.tableData addObject:@"Breast Feeding"];
    [self.tableData addObject:@"Cesarian Section"];
    [self.tableData addObject:@"Uterus Removal/Hysterectomy"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.tableView reloadData];
}



- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
   //need to searth through all the elements on this and lowe
    //read data from database? or read data off tableview?
    
    
}


#pragma mark - Table View

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    int rowCount;
//    if(self.isFiltered)
//        rowCount = self.filterData.count;
//    else
//        rowCount = self.tableData.count;
//    
//    return rowCount;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil)
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    
//    UITableViewCell *newCell;
//    if(self.isFiltered)
//        newCell = [self.filterData objectAtIndex:indexPath.row];
//    else
//        newCell = [self.tableData objectAtIndex:indexPath.row];
//    
//    // ... Set up the cell here...;
//    
//    return cell;
//}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return _objects.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//
//    NSDate *object = _objects[indexPath.row];
//    cell.textLabel.text = [object description];
//    return cell;
//}
//
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDate *object = _objects[indexPath.row];
    self.detailViewController.detailItem = object;

    self.detailViewController.commentsScroller.hidden = true;
    [self.detailViewController.commentsScroller setNeedsDisplay];

}

@end

//
//  SubMasterViewController.m
//  MedAppJam
//
//  Created by Ethan Wessel on 11/14/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import "SubMasterViewController.h"


@interface SubMasterViewController ()
@end

@implementation SubMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
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

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadLines:(NSString *)labelText{
    NSArray *fileChunks = [labelText componentsSeparatedByString:@" "];
    //file name will be denoted by the first two portions of the text from the label
    NSString *fileName = [[[[fileChunks objectAtIndex:0] stringByAppendingString:@"_"] stringByAppendingString:[fileChunks objectAtIndex:1]] stringByAppendingString:@".txt"];
    self.fileLoader = [[FileContentLoader alloc] initWithFileName:fileName]; //this will contain lines in which we can use.
}

- (void)loadEmbeddedVideo:(NSString *)labelText{
    //Load in the html embedded video
    NSString *extension = [self.urlList objectForKey:labelText];            //obtain url for label name
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
                          <iframe height=\"%d\" width=\"%d\" frameborder=\"0\" src=\"http://www.youtube.com/embed/%@\"></iframe>\
                          </body></html>", height, width, extension];
    
    self.detailViewController.player.hidden = false;
    [self.detailViewController.player loadHTMLString:embedHTML baseURL:nil];
    NSLog(@"%d, %d", height, width);

}

- (void)loadDataIntoView{
    
    CommentsView *comments = self.detailViewController.comments;
    comments.commentObjects = [[NSMutableArray alloc] init];
    QuizView *quiz = self.detailViewController.quiz;
    
    //read through lines and place into spots
    for (NSString *line in self.fileLoader.lines) {
        //extract comments and quiz
        NSArray *lineChunks = [line componentsSeparatedByString:@":"];
        
        //if the first portion of the line is a zero its a comment, skip over it
        if([[lineChunks objectAtIndex:0] isEqualToString:@"0"]){
            continue;
        }
        else{
            //if it is a video comment
            if([[lineChunks objectAtIndex:0] isEqualToString:@"1"]){
                
                //set up new frame for positioning
                CGRect frame;
                if(comments.commentObjects.count == 0){
                    frame = CGRectMake(0, 0, comments.bounds.size.width, 40);
                }
                else{
                    CommentObject *prevObject = [comments.commentObjects objectAtIndex:comments.commentObjects.count - 1];
                    CGFloat yPos = prevObject.bounds.origin.y + prevObject.bounds.size.height + 5;
                    frame = CGRectMake(0, yPos, comments.bounds.size.width, 40);
                }
                
                //check if it is a doctor or patient comment
                if([[lineChunks objectAtIndex:1] isEqualToString:@"D"]){
                    //grab DOCTOR and place into comment object
                    //create new comments object and place into subview of comments
                    CommentObject *comment = [[CommentObject alloc] initWithFrame:frame withString:[lineChunks objectAtIndex:2] withIsDoctor:true];
                    [comments.commentObjects addObject:comment];
                }
                else if([[lineChunks objectAtIndex:1] isEqualToString:@"P"]){
                    //grab PATIENT and place into comment object
                    //create new comments object and place into subview of comments
                    CommentObject *comment = [[CommentObject alloc] initWithFrame:frame withString:[lineChunks objectAtIndex:2] withIsDoctor:false];
                    [comments.commentObjects addObject:comment];
                }
            }
//            //if it is a question
//            else if([[lineChunks objectAtIndex:0] isEqualToString:@"2"]){
//                //grab question and place it into quiz object
//            }
//            //if it is a question answer
//            else if([[lineChunks objectAtIndex:0] isEqualToString:@"3"]){
//                //grab truth value and place it into quiz object
//                //NSString *truthValue =
//                //grab position and place it into quiz object
//                //grab answer and place it into quiz object
//            }
        }
        
    }
    
    //after reading in all of the lines we will display the data on the view
    [comments addCommentsToView];    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //Obtain label text of video that we'll be searching from cell
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    UILabel *l = [[cell.contentView subviews] objectAtIndex:0];
    NSString *labelText = l.text;
    NSLog(@"%@", labelText);
    
    [self loadEmbeddedVideo:labelText];
    
    //Setup respective comments and quiz data
    self.detailViewController.tabControl.hidden = false;
    self.detailViewController.comments.hidden = false;
    
    [self loadLines:labelText]; //load in the lines
    [self loadDataIntoView];
}














@end

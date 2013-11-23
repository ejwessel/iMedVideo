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
//    self.urlList = [[NSMutableDictionary alloc] init];
//    [self.urlList setObject:@"BALLA" forKey:@"Appendix Surgery"];
//    [self.urlList setObject:@"url" forKey:@"Gall Bladder Surgery"];
//    [self.urlList setObject:@"url" forKey:@"Hernia Repair"];
//    [self.urlList setObject:@"url" forKey:@"Ileostomy Bag Care"];
//    [self.urlList setObject:@"rMMpeLLgdgY" forKey:@"Check Blood Sugar"];
//    [self.urlList setObject:@"KSoFIyQq8o8" forKey:@"Diet"];
//    [self.urlList setObject:@"PqgKFsK7f-Q" forKey:@"Inject Insulin"];
//    [self.urlList setObject:@"url" forKey:@"Cast Care"];
//    [self.urlList setObject:@"url" forKey:@"Hip Replacement"];
//    [self.urlList setObject:@"url" forKey:@"Knee Replacement"];
//    [self.urlList setObject:@"url" forKey:@"Cataracts"];
//    [self.urlList setObject:@"url" forKey:@"Contacts"];
//    [self.urlList setObject:@"url" forKey:@"Eye Drops"];
//    [self.urlList setObject:@"url" forKey:@"Coronary Artery Bypass"];
//    [self.urlList setObject:@"url" forKey:@"Coronary Catheterization"];
//    [self.urlList setObject:@"url" forKey:@"Heart Failure"];
//    [self.urlList setObject:@"url" forKey:@"Lung Removal Surgery/Lobectomy"];
//    [self.urlList setObject:@"url" forKey:@"Pneumonia"];
//    [self.urlList setObject:@"url" forKey:@"Breast Feeding"];
//    [self.urlList setObject:@"url" forKey:@"Cesarian Section"];
//    [self.urlList setObject:@"url" forKey:@"Uterus Removal/Hysterectomy"];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadLines:(NSString *)labelText{

    NSString *f = labelText;
    f = [f stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSMutableString *fileName = [[NSMutableString alloc] initWithString:f];
    self.detailViewController.tableLastClickedName = fileName;
    [fileName appendString:@".txt"];
    self.fileLoader = [[FileContentLoader alloc] initWithFileName:fileName]; //this will contain lines in which we can use.
}

- (void)loadEmbeddedVideo:(NSString *)labelText{
    //Load in the html embedded video

    //NSString *extension = [self.urlList objectForKey:labelText];            //obtain url for label name from hash table
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
                          </body></html>", height, width, self.linkExtension];
    
    //&rel=0 to get rid of related videos
    
    self.detailViewController.player.hidden = false;
    [self.detailViewController.player loadHTMLString:embedHTML baseURL:nil];
    NSLog(@"video size: %d, %d", height, width);

}

- (void)loadDataIntoView{
    
    CommentsView *comments = self.detailViewController.comments;
    comments.commentObjects = [[NSMutableArray alloc] init];
    
    QuizView *quiz = self.detailViewController.quiz;
    quiz.quizData = [[NSMutableArray alloc] init];
    quiz.link = @"";
    
    QuizObject *tempQuiz;
    
    CGFloat updatePos = 0;
    
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
                
                int commentXPos = 20;
                int commentHeight = 25; // original 20
                
                //set up new frame for positioning
                CGRect frame;
                if(comments.commentObjects.count == 0){
                    frame = CGRectMake(commentXPos, 0, comments.bounds.size.width - commentXPos, commentHeight);
                }
                else{
                    CommentObject *prevObject = comments.commentObjects.lastObject;//[comments.commentObjects objectAtIndex:comments.commentObjects.count - 1];
                    updatePos = (updatePos + prevObject.bounds.size.height + 5);
                    frame = CGRectMake(commentXPos, updatePos, comments.bounds.size.width - commentXPos, commentHeight);
                }
                
                //check if it is a doctor or patient comment
                if([[lineChunks objectAtIndex:1] isEqualToString:@"D"]){
                    //grab DOCTOR and place into comment object
                    //create new comments object and place into subview of comments
                    NSMutableString *text = [[NSMutableString alloc] initWithString:@""];
                    [text appendString:[lineChunks objectAtIndex:2]];
                    CommentObject *comment = [[CommentObject alloc] initWithFrame:frame withString:text withIsDoctor:true];
                    [comments.commentObjects addObject:comment];
                }
                else if([[lineChunks objectAtIndex:1] isEqualToString:@"P"]){
                    //grab PATIENT and place into comment object
                    //create new comments object and place into subview of comments
                    NSMutableString *text = [[NSMutableString alloc] initWithString:@""];
                    [text appendString:[lineChunks objectAtIndex:2]];
                    CommentObject *comment = [[CommentObject alloc] initWithFrame:frame withString:text withIsDoctor:false];
                    [comments.commentObjects addObject:comment];
                }
            }
            //if it is a question
            else if([[lineChunks objectAtIndex:0] isEqualToString:@"2"]){
                //grab question and place it into quiz object
                tempQuiz = [[QuizObject alloc] init];
                tempQuiz.question = [lineChunks objectAtIndex:1];
                tempQuiz.totalNumOptions = 0;
                
            }
            //if it is a question answer
            else if([[lineChunks objectAtIndex:0] isEqualToString:@"3"]){
                
                if([[lineChunks objectAtIndex:1] isEqualToString:@"T"]){
                    tempQuiz.correctOption = [lineChunks objectAtIndex:2];
                }
                
                if([[lineChunks objectAtIndex:2] isEqualToString:@"A"]){
                    tempQuiz.option1 = [lineChunks objectAtIndex:3];
                    tempQuiz.totalNumOptions++;
                }
                else if([[lineChunks objectAtIndex:2] isEqualToString:@"B"]){
                    tempQuiz.option2 = [lineChunks objectAtIndex:3];
                    tempQuiz.totalNumOptions++;
                }
                else if([[lineChunks objectAtIndex:2] isEqualToString:@"C"]){
                    tempQuiz.option3 = [lineChunks objectAtIndex:3];
                    tempQuiz.totalNumOptions++;
                }
                else if([[lineChunks objectAtIndex:2] isEqualToString:@"D"]){
                    tempQuiz.option4 = [lineChunks objectAtIndex:3];
                    tempQuiz.totalNumOptions++;
                }
            }
            else if([[lineChunks objectAtIndex:0] isEqualToString:@"4"]){
                tempQuiz.explanationTxt = [lineChunks objectAtIndex:1];
            }
            else if([[lineChunks objectAtIndex:0] isEqualToString:@"5"]){
                tempQuiz.videoTime = [lineChunks objectAtIndex:1];
                //once we have explanation we can input object
                [quiz.quizData addObject:tempQuiz];

            }
            else if([[lineChunks objectAtIndex:0] isEqualToString:@"6"]){
                self.linkExtension = [lineChunks objectAtIndex:1];
                quiz.link = [lineChunks objectAtIndex:1];
            }
        }
    }
    
    //after reading in all of the lines we will display the data on the view
    [comments addCommentsToView];
    [quiz addInitialQuizView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //hide keyboard if subview is clicked
    self.detailViewController.t.text = @"";
    [self.detailViewController.t resignFirstResponder];
    [self.detailViewController.commentField resignFirstResponder];
    
    //need to clear out previous view that is being displayed, we will default on comments first
    self.detailViewController.tabControl.hidden = false;
    self.detailViewController.tabControl.selectedSegmentIndex = 0;
    self.detailViewController.quiz.hidden = false;
    self.detailViewController.comments.hidden = true;
    self.detailViewController.commentField.hidden = true;

    
    //Obtain label text of video that we'll be searching from cell
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    UILabel *l = [[cell.contentView subviews] objectAtIndex:0];
    NSString *labelText = l.text;
    NSLog(@"label clicked: %@", labelText);
    
    self.detailViewController.instructionView.hidden = true;
    self.detailViewController.title = labelText;
    
    [self loadLines:labelText]; //load in the lines
    [self loadDataIntoView];
    [self loadEmbeddedVideo:labelText];
}














@end

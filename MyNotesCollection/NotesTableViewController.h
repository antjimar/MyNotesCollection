//
//  NotesTableViewController.h
//  MyNotesCollection
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 13/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NoteViewController;

@interface NotesTableViewController : UIViewController

@property (strong, nonatomic) UITableView *notesTableView;
@property (strong, nonatomic) NSMutableArray *notes;
@property (copy, nonatomic) NSString *notesTitle;

@property (strong, nonatomic) NoteViewController *noteViewController;


@end

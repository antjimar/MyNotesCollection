//
//  NotesTableViewController.m
//  MyNotesCollection
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 13/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "NotesTableViewController.h"
#import "NoteViewController.h"
#import "IHUtilities.h"

NSString * const kCellID = @"CellId";

@interface NotesTableViewController ()<UITableViewDataSource, UITableViewDelegate, NoteViewControllerDelegate>


@end

@implementation NotesTableViewController

-(instancetype)init {
    
    if (self = [super init]) {
        _notesTableView = [[UITableView alloc] init];
        _notes = [[NSMutableArray alloc] init];
        _noteViewController = [[NoteViewController alloc] init];
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.notesTableView.frame = self.view.bounds;
    // Set top inset in table view (navigationBar + statusBar)
    self.notesTableView.contentInset = UIEdgeInsetsMake([UIApplication sharedApplication].statusBarFrame.size.height
                                                        + [IHUtilities getFrameStatusBar].size.height,
                                                        0, 0, 0);
    // Don't show lines if there aren't data
    self.notesTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    
    UIImageView *imageEmpty = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"empty_table"]];
    imageEmpty.frame = CGRectMake(95, 67, 224, 259);
    
    if (self.notes.count == 0) {
        // Show Image
        [self.notesTableView addSubview:imageEmpty];
        
    } else {
        self.notesTableView.delegate = self;
        self.notesTableView.dataSource = self;
        
        // Register cell
        [self.notesTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellID];
        
        // Don't show lines if there aren't data
        self.notesTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    
    // Delegate for NoteViewController
    self.noteViewController.delegate = self;

}


#pragma mark - Table view data source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.notesTableView dequeueReusableCellWithIdentifier:kCellID];
    cell.textLabel.text = self.notes[indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notes.count;
}


#pragma mark - NoteViewControllerDelegate Methods

-(void)addNoteToTable:(NSString *)noteText {
    
}

@end

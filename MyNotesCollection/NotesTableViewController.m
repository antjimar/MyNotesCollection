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
#import "Note.h"

NSString * const kCellID = @"CellId";

@interface NotesTableViewController ()<UITableViewDataSource, UITableViewDelegate, NoteViewControllerDelegate>

@end

@implementation NotesTableViewController

-(instancetype)init {
    
    if (self = [super init]) {
        _notesTableView = [[UITableView alloc] init];
        _notes = [[NSMutableArray alloc] init];
        _noteViewController = [[NoteViewController alloc] init];
        _notesTitle = [[NSString alloc] init];
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
    
    self.notesTableView.delegate = self;
    self.notesTableView.dataSource = self;
    
    // Register cell
    [self.notesTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellID];
    
    // Don't show lines if there aren't data
    self.notesTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}


#pragma mark - Table view data source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.notesTableView dequeueReusableCellWithIdentifier:kCellID];
    Note *note = self.notes[indexPath.row];
    cell.textLabel.text = note.noteName;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notes.count;
}


#pragma mark - Table view delegate Methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UILabel *gettingSizeLabel = [[UILabel alloc] init];
    gettingSizeLabel.text = [(Note *)self.notes[indexPath.row] noteName];
    gettingSizeLabel.numberOfLines = 0;
    gettingSizeLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize maximumLabelSize = CGSizeMake(310, 9999);
    
    CGSize expectSize = [gettingSizeLabel sizeThatFits:maximumLabelSize];
    
    return expectSize.height + 10;
}

#pragma mark - NoteViewControllerDelegate Methods

-(void)addNoteToTable:(NSString *)noteText {
    
    Note *note = [[Note alloc] init];
    note.noteName = noteText;
    [self.notes addObject:note];
    [self.notesTableView reloadData];
    
}

@end

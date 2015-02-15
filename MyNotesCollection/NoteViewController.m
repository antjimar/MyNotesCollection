//
//  NoteViewController.m
//  MyNotesCollection
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 13/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "NoteViewController.h"
#import "IHUtilities.h"
#import "NotesTableViewController.h"

@interface NoteViewController ()

@property (strong, nonatomic) UITextView *noteTextView;

@end

@implementation NoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.noteTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 30, 300, 100)];
    self.noteTextView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.noteTextView.layer.borderWidth = 1.6f;
    self.noteTextView.layer.cornerRadius = 8.0f;
    [self.view addSubview:self.noteTextView];
    
    UIButton *saveButton = [IHUtilities createButtonWithTitle:@"Save"
                                                        state:UIControlStateNormal
                                                         type:UIButtonTypeSystem
                                                        frame:CGRectMake(10, 130, 100, 50)];
    [self.view addSubview:saveButton];
    [saveButton addTarget:self
                   action:@selector(addNote)
         forControlEvents:UIControlEventTouchUpInside];

}


#pragma mark - Actions Methods

- (void)addNote {
    [self.delegate addNoteToTable:self.noteTextView.text];
    [(NotesTableViewController *)self.delegate viewDidLoad];
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end

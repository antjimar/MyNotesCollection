//
//  ViewController.m
//  MyNotesCollection
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 13/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "ViewController.h"
#import "NotesTableViewController.h"
#import "NoteViewController.h"
#import "Notebook.h"
#import "Note.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;
@property (strong, nonatomic) NSMutableArray *notesTableViewController;
@property (strong, nonatomic) NSMutableArray *notebooks;
@property (strong, nonatomic) NoteViewController *noteViewController;
@property (strong, nonatomic) NotesTableViewController *activeTableViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set data
    [self setUpDataAndInitProperties];
    
    // CollectionView
    [self setUpLayout];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
    self.collectionView.frame = self.view.bounds;
    [self.collectionView setCollectionViewLayout:self.layout];
    [self.view addSubview:self.collectionView];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.pagingEnabled = YES;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    
    // BarButtonItem
    UIBarButtonItem *addNote = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNote)];
    [self.navigationItem setRightBarButtonItem:addNote];
    
    UIBarButtonItem *addNotebook = [[UIBarButtonItem alloc] initWithTitle:@"Add Notebook" style:UIBarButtonItemStyleDone target:self action:@selector(addNotebook)];
    [self.navigationItem setLeftBarButtonItem:addNotebook];
    
    [self setUpNotesTableViewController];
    
}


#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.notesTableViewController.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Get cell
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])
                                                                                forIndexPath:indexPath];
    NotesTableViewController *tVC = self.notesTableViewController[indexPath.row];
    [cell.contentView addSubview:tVC.notesTableView];
    [self.navigationItem setTitle:tVC.notesTitle];
    // To know the active table View Controller
    self.activeTableViewController = tVC;

    return cell;
}


#pragma mark - UICollectionViewDelegate Methods



#pragma mark - UICollectionViewDelegateFlowLayout Methods



#pragma mark - Actions Methods

- (void)addNote {
    self.noteViewController.delegate = (id<NoteViewControllerDelegate>)self.activeTableViewController;
    // open modal
    [self.activeTableViewController presentViewController:self.noteViewController animated:YES completion:nil];
}

-(void)addNotebook {
    Notebook *newNotebook = [[Notebook alloc] initWithName:@"New Notebook" andNotes:nil];
    [self.notebooks addObject:newNotebook];
    [self addNotebookToNotesTableViewController:newNotebook atIndex:self.notesTableViewController.count];
    [self.collectionView reloadData];
}


#pragma mark - Helpers Methods

- (void)setUpLayout {
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.layout.itemSize = self.view.frame.size;
    self.layout.minimumInteritemSpacing = 0.0f;
    self.layout.minimumLineSpacing = 0.0f;
}

- (void)setUpNotesTableViewController {
    [self.notebooks enumerateObjectsUsingBlock:^(Notebook *notebook, NSUInteger idx, BOOL *stop) {
        [self addNotebookToNotesTableViewController:notebook atIndex:idx];
    }];
}

- (void)addNotebookToNotesTableViewController:(Notebook *)notebook atIndex:(NSUInteger)index {
    NotesTableViewController *tableViewController = [[NotesTableViewController alloc] init];
    [notebook.notes enumerateObjectsUsingBlock:^(Note *note, NSUInteger idx, BOOL *stop) {
        [tableViewController.notes addObject:note];
    }];
    tableViewController.notesTitle = notebook.notebookName;
    [self.notesTableViewController addObject:tableViewController];
    [self addChildNoteTableViewController:tableViewController forIndex:index];
}

- (void)addChildNoteTableViewController:(NotesTableViewController *)noteTableView
                               forIndex:(NSUInteger)index {
    // Add child View Contorller
    [self addChildViewController:noteTableView];
    noteTableView.view.frame = CGRectMake((index * self.view.bounds.size.width), 0, self.view.bounds.size.width, self.view.bounds.size.width);
    [noteTableView didMoveToParentViewController:self];
}

- (void)setUpDataAndInitProperties {
    // Init model
    self.notebooks = [[NSMutableArray alloc] init];

    // Create notes
    Note *noteOne = [[Note alloc] initWithNoteName:@"Note 1"];
    Note *noteTwo = [[Note alloc] initWithNoteName:@"Note 2"];
    Note *noteThree = [[Note alloc] initWithNoteName:@"Note 3"];
    Note *noteFour = [[Note alloc] initWithNoteName:@"Note 4"];
    Note *noteFive = [[Note alloc] initWithNoteName:@"Note 5"];
    Note *noteSix = [[Note alloc] initWithNoteName:@"Note 6"];
    Note *noteSeven = [[Note alloc] initWithNoteName:@"Note 7"];
    Note *noteEight = [[Note alloc] initWithNoteName:@"Note 8"];
    Note *noteNine = [[Note alloc] initWithNoteName:@"Note 9"];
    
    // Create notebooks
    Notebook *notebookOne = [[Notebook alloc] initWithName:@"Notebook 1" andNotes:[@[noteOne, noteTwo, noteThree] mutableCopy]];
    Notebook *notebookTwo = [[Notebook alloc] initWithName:@"Notebook 2" andNotes:[@[noteFour, noteFive, noteSix] mutableCopy]];
    Notebook *notebookThree = [[Notebook alloc] initWithName:@"Notebook 3" andNotes:[@[noteSeven, noteEight, noteNine] mutableCopy]];
    Notebook *notebookEmpty = [[Notebook alloc] initWithName:@"Notebook 4" andNotes:nil];
    
    self.notebooks = [@[notebookOne, notebookTwo, notebookThree, notebookEmpty] mutableCopy];
    
    // Init properties
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.notesTableViewController = [[NSMutableArray alloc] init];
    self.noteViewController = [[NoteViewController alloc] init];
    self.activeTableViewController = [[NotesTableViewController alloc] init];
}

@end
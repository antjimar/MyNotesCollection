//
//  ViewController.m
//  MyNotesCollection
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 13/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "ViewController.h"
#import "NotesTableViewController.h"
#import "Notebook.h"
#import "Note.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;
@property (strong, nonatomic) NSMutableArray *notesTableViewController;
@property (strong, nonatomic) NSMutableArray *notebooks;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Init model
    self.notebooks = [[NSMutableArray alloc] init];
    // Set data
    [self setUpData];
    
    // Init properties
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.notesTableViewController = [[NSMutableArray alloc] init];
    
    [self setUpNotesTableViewController];

    
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
    
    // put TableViewController's son
    [self.notesTableViewController enumerateObjectsUsingBlock:^(NotesTableViewController *noteTableViewController, NSUInteger idx, BOOL *stop) {
        [self addChildNoteTableViewController:noteTableViewController forIndex:idx];
    }];
    
    
    //[self addChildNoteTableViewController:self.notesTableViewController forIndex:0];
    //[self.notesTableViewController setNotes:[self.notesNotebookOne mutableCopy]];
    
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
    
    return cell;
}



#pragma mark - UICollectionViewDelegate Methods







#pragma mark - UICollectionViewDelegateFlowLayout Methods






#pragma mark - Actions Methods

- (void)addNote {
    // Check the table that we are.
    
    // open modal
}


#pragma mark - Helpers Methods

- (void)setUpLayout {
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.layout.itemSize = self.view.frame.size;
    self.layout.minimumInteritemSpacing = 0.0f;
    self.layout.minimumLineSpacing = 0.0f;
}


- (void)addChildNoteTableViewController:(NotesTableViewController *)noteTableView
                               forIndex:(NSUInteger)index {
    // Add child View Contorller
    [self addChildViewController:noteTableView];
    noteTableView.view.frame = CGRectMake((index * self.view.bounds.size.width), 0, self.view.bounds.size.width, self.view.bounds.size.width);
    [noteTableView didMoveToParentViewController:self];
}


- (void)setUpData {
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
    
    self.notebooks = [@[notebookOne, notebookTwo, notebookThree] mutableCopy];
}

- (void)setUpNotesTableViewController {
    [self.notebooks enumerateObjectsUsingBlock:^(Notebook *notebook, NSUInteger idx, BOOL *stop) {
        NotesTableViewController *tableViewController = [[NotesTableViewController alloc] init];
        [notebook.notes enumerateObjectsUsingBlock:^(Note *note, NSUInteger idx, BOOL *stop) {
            [tableViewController.notes addObject:note];
        }];
        tableViewController.notesTitle = notebook.notebookName;
        [self.notesTableViewController addObject:tableViewController];
    }];
}

@end


















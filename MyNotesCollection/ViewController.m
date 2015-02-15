//
//  ViewController.m
//  MyNotesCollection
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 13/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "ViewController.h"
#import "NotesTableViewController.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;

// List of notes notebooks
@property (strong, nonatomic) NSDictionary *notes;






//Pruebas
@property (strong, nonatomic) NSArray *notesNotebookOne; // Listado de notas de una libreta

@property (strong, nonatomic) NotesTableViewController *notesTableViewController;


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Init properties
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.notesNotebookOne = [[NSArray alloc] init];
    self.notesTableViewController = [[NotesTableViewController alloc] init];
    
    // Pruebas
    self.notesNotebookOne = @[@"nota 1.1.", @"nota 1.2"];
    self.notesTableViewController.notes = [self.notesNotebookOne mutableCopy];
    
    
    /*
    // Set noteBooks and notes in notebooks
    self.notes = [[NSDictionary alloc] init];
    self.notes = @{
                   @"Notebook One": @[@"nota 1.1.", @"nota 1.2"],
                   @"Notebook Two": @[@"nota 2.1.", @"nota 2.2"],
                   @"Notebook Three": @[@"nota 3.1.", @"nota 3.2"],
                   @"Notebook Four": @[@"nota 4.1.", @"nota 4.2"],
                   };
*/
    // CollectionView
    [self setUpLayout];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
    self.collectionView.frame = self.view.bounds;
    [self.collectionView setCollectionViewLayout:self.layout];
    [self.view addSubview:self.collectionView];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    
    // BarButtonItem
    UIBarButtonItem *addNote = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNote)];
    [self.navigationItem setRightBarButtonItem:addNote];
    
    // put TableViewController's son
    [self addChildNoteTableViewController:self.notesTableViewController forIndex:0];
    [self.notesTableViewController setNotes:[self.notesNotebookOne mutableCopy]];
    
}


#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Get cell
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])
                                                                                forIndexPath:indexPath];
    
    [cell.contentView addSubview:self.notesTableViewController.notesTableView];
    
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

@end


















//
//  Notebook.m
//  MyNotesCollection
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 15/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "Notebook.h"

@implementation Notebook

- (instancetype)initWithName:(NSString *)notebookName
                    andNotes:(NSMutableArray *)notes {
    
    if (self = [super init]) {
        _notebookName = [notebookName copy];
        _notes = notes;
    }
    
    return self;
}

@end

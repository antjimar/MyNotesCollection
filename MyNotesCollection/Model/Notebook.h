//
//  Notebook.h
//  MyNotesCollection
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 15/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notebook : NSObject

@property (copy, nonatomic) NSString *notebookName;
@property (strong, nonatomic) NSMutableArray *notes;

- (instancetype)initWithName:(NSString *)notebookName andNotes:(NSMutableArray *)notes;

@end

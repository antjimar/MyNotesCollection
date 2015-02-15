//
//  Note.m
//  MyNotesCollection
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 15/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "Note.h"

@implementation Note

- (instancetype)initWithNoteName:(NSString *)noteName {
    
    if (self = [super init]) {
        _noteName = [noteName copy];
    }
    
    return self;
}


@end

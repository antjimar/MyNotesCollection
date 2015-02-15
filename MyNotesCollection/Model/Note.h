//
//  Note.h
//  MyNotesCollection
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 15/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property (copy, nonatomic) NSString *noteName;

- (instancetype)initWithNoteName:(NSString *)noteName;

@end

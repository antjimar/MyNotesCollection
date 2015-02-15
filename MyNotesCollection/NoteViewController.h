//
//  NoteViewController.h
//  MyNotesCollection
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 13/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NoteViewControllerDelegate <NSObject>

- (void)addNoteToTable:(NSString *)noteText;

@end

@interface NoteViewController : UIViewController

@property (strong, nonatomic) id<NoteViewControllerDelegate> delegate;

@end

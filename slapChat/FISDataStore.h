//
//  FISDataStore.h
//  playingWithCoreData
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"

@interface FISDataStore : NSObject

+ (instancetype) sharedDataStore;


@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *model;


- (void)save;
-(NSArray *)loadAllItems;
-(Message *)createMessage;
@end

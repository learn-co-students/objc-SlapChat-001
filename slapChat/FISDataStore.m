//
//  FISDataStore.m
//  playingWithCoreData
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISDataStore.h"

@implementation FISDataStore
@synthesize managedObjectContext = _managedObjectContext;


+ (instancetype)sharedDataStore {
    static FISDataStore *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[FISDataStore alloc] init];
        [_sharedDataStore startWith];
    });

    return _sharedDataStore;
}


-(NSManagedObjectContext *)managedObjectContext{
    
    if(_managedObjectContext != nil){
        return _managedObjectContext;
    }
    
      NSError *error = nil;
 
    NSURL *store = [[self applicationDocumentsDirectory]URLByAppendingPathComponent:@"slapChat.sqlite"];
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"slapChat" withExtension:@"momd"];
 
        // Read in slapChat datamodel
        
        _model = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelURL];
        
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:_model];
    
    [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:store options:nil error:&error];
    
        
        // Where does the SQLite file go
        
    
        
    if (psc != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc]init];
        _managedObjectContext.persistentStoreCoordinator = psc;
    }
              
    
    
    
    return _managedObjectContext;
}

- (void)save
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"%@, %@", error, [error userInfo]);
            abort();
        }
    }
}


-(NSArray *)loadAllItems{
  
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        
        NSEntityDescription *e = [NSEntityDescription entityForName:@"Message" inManagedObjectContext:self.managedObjectContext];
        request.entity = e;
        
        NSError *error;
        NSArray *messag = [self.managedObjectContext executeFetchRequest:request error:&error];
        
        
       
    return messag;
    
    
}

-(Message *)createMessage{
    
    Message *message = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.managedObjectContext];
  
    
    return message;
}

- (void)startWith
{
    for (int i = 0; i < 15; i++) {
        Message *newMessage = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.managedObjectContext];
        newMessage.content = [NSString stringWithFormat: @"New Message: %d", i+1];
        newMessage.createdAt = [NSDate date];
    }
    [self save];
}




#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.



#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
@end

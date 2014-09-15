//
//  Message+DateFormatter.m
//  slapChat
//
//  Created by Chris Gonzales on 9/15/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "Message+DateFormatter.h"

@implementation Message (DateFormatter)

-(NSString *)formattedDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
//    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"HH:mm:ss a"];
    
    return [dateFormatter stringFromDate:self.createdAt];
}
@end

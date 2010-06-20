//
//  NSString+FileSize.h
//  Spark
//
//  Created by Luke Redpath on 22/05/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (FileSize)

+ (NSString *)fileSizeStringFromByes:(int)bytes;

@end

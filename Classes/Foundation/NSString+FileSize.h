//
//  NSString+FileSize.h
//  LRToolkit
//
//  Created by Luke Redpath on 22/05/2010.
//
//  Taken from http://snippets.dzone.com/posts/show/3038
//

#import <Foundation/Foundation.h>


@interface NSString (FileSize)

+ (NSString *)fileSizeStringFromBytes:(int)bytes;

@end

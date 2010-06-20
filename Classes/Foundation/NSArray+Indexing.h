//
//  NSArray+Indexing.h
//  LRToolkit
//
//  Created by Luke Redpath on 16/02/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSArray (Indexing)

- (NSArray *)indexUsingCollation:(UILocalizedIndexedCollation *)collation withSelector:(SEL)selector;

@end

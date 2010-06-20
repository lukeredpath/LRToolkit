//
//  NSArray+Indexing.h
//  TellYouGov
//
//  Created by James Adam on 16/02/2010.
//  Copyright 2010 Lazyatom Limited. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSArray (Indexing)

- (NSArray *)indexUsingCollation:(UILocalizedIndexedCollation *)collation withSelector:(SEL)selector;

@end

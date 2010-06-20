//
//  UIToolbar+SwapItem.m
//  Flare
//
//  Created by Luke Redpath on 17/06/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import "UIToolbar+LRAdditions.h"


@implementation UIToolbar (LRAdditions)

- (void)swapBarItem:(UIBarItem *)oldItem withItem:(UIBarItem *)newItem;
{
  NSMutableArray *currentItems = [self.items mutableCopy];
  if (![currentItems containsObject:oldItem]) {
    NSLog(@"Warning: tried to swap out %@ from toolbar %@ items when it doesn't exist", oldItem, self);
    return;
  }
  NSInteger indexOfOldItem = [currentItems indexOfObject:oldItem];
  [currentItems replaceObjectAtIndex:indexOfOldItem withObject:newItem];
  [self setItems:currentItems];
}

@end

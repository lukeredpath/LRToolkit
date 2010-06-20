//
//  UIToolbar+SwapItem.h
//  Flare
//
//  Created by Luke Redpath on 17/06/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIToolbar (LRAdditions)

- (void)swapBarItem:(UIBarItem *)oldItem withItem:(UIBarItem *)newItem;

@end

//
//  LRTableViewCollection.h
//  TellYouGov
//
//  Created by Luke Redpath on 19/04/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LRTableViewCollection : NSObject {
  NSMutableArray *objects;
  NSArray *indexedObjects;
  NSArray *filteredObjects;
  UILocalizedIndexedCollation *collation;
  SEL indexSelector;
  NSArray *sortDescriptors;
  NSPredicate *filterPredicate;
}
@property (nonatomic, copy) NSArray *objects;
@property (nonatomic, retain) UILocalizedIndexedCollation *collation;
@property (nonatomic, assign) SEL indexSelector;
@property (nonatomic, copy) NSArray *sortDescriptors;
@property (nonatomic, retain) NSPredicate *filterPredicate;
@property (nonatomic, readonly) NSInteger sectionCount;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)indexPathForObject:(id)object;
- (NSIndexPath *)insertObject:(id)object atIndex:(NSInteger)index;
- (NSArray *)appendObjects:(NSArray *)moreObjects;
- (NSIndexPath *)insertObject:(id)object;
- (NSIndexPath *)removeObject:(id)object;
- (void)clear;
@end

//
//  LRTableViewCollection.m
//  TellYouGov
//
//  Created by Luke Redpath on 19/04/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import "LRTableViewCollection.h"
#import "NSArray+Indexing.h"

@implementation LRTableViewCollection

@synthesize objects;
@synthesize collation;
@synthesize indexSelector;
@synthesize sortDescriptors;
@synthesize filterPredicate;
@dynamic sectionCount;

- (void)dealloc {
  [sortDescriptors release];
  [objects release];
  [indexedObjects release];
  [filteredObjects release];
  [collation release];
  [filterPredicate release];
  [super dealloc];
}

- (id)init;
{
  if (self = [super init]) {
    objects = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void)clear;
{
  [objects release];
  objects = [[NSMutableArray alloc] init];
}

- (void)setObjects:(NSArray *)array;
{
  [objects release]; objects = [array mutableCopy];

  if (self.collation) {
    indexedObjects = [[objects indexUsingCollation:self.collation withSelector:indexSelector] retain];
  }
  if (self.sortDescriptors) {
    [objects sortUsingDescriptors:self.sortDescriptors];
  }
}

- (NSIndexPath *)insertObject:(id)object atIndex:(NSInteger)index;
{
  [objects insertObject:object atIndex:index];
  
  if (self.collation) {
    indexedObjects = [[objects indexUsingCollation:self.collation withSelector:indexSelector] retain];
  }
  if (self.sortDescriptors) {
    [objects sortUsingDescriptors:self.sortDescriptors];
  }
  
  return [self indexPathForObject:object];
}

- (NSArray *)appendObjects:(NSArray *)moreObjects;
{
  self.objects = [objects arrayByAddingObjectsFromArray:moreObjects];
  
  NSMutableArray *indexPaths = [NSMutableArray array];
  for (id object in moreObjects) {
    [indexPaths addObject:[self indexPathForObject:object]];
  }
  return indexPaths;
}

- (NSIndexPath *)insertObject:(id)object;
{
  [objects addObject:object];
  
  if (self.collation) {
    indexedObjects = [[objects indexUsingCollation:self.collation withSelector:indexSelector] retain];
  }
  if (self.sortDescriptors) {
    [objects sortUsingDescriptors:self.sortDescriptors];
  }
  return [self indexPathForObject:object];
}

- (NSIndexPath *)removeObject:(id)object;
{
  NSIndexPath *indexPath = [self indexPathForObject:object];
  
  [objects removeObject:object];
  
  if (self.collation) {
    indexedObjects = [[objects indexUsingCollation:self.collation withSelector:indexSelector] retain];
  }
  return indexPath;
}

- (void)setFilterPredicate:(NSPredicate *)predicate;
{
  if (predicate != filterPredicate) {
    [filterPredicate release]; filterPredicate = [predicate retain];
    
    if (filterPredicate == nil) {
      [filteredObjects release]; filteredObjects = nil;
    } else {
      filteredObjects = [[self.objects filteredArrayUsingPredicate:self.filterPredicate] retain];
    }    
  }
}

#pragma mark -
#pragma mark Dynamic collection properties

- (NSInteger)sectionCount;
{
  if (self.filterPredicate == nil && indexedObjects != nil) {
    return [indexedObjects count];
  }
  return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section;
{
  if (self.filterPredicate) {
    return [filteredObjects count];
  } else if (indexedObjects != nil) {
    return [[indexedObjects objectAtIndex:section] count];
  }
  return [objects count];
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
{
  if (self.filterPredicate) {
    return [filteredObjects objectAtIndex:indexPath.row];
  } else if (indexedObjects != nil) {
    return [[indexedObjects objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
  }
  return [objects objectAtIndex:indexPath.row];
}

- (NSIndexPath *)indexPathForObject:(id)object;
{
  if (self.filterPredicate) {
    return [NSIndexPath indexPathForRow:[self.objects indexOfObject:object] inSection:0];
  } else if (indexedObjects != nil) {
    NSInteger section = [self.collation sectionForObject:object collationStringSelector:indexSelector];
    NSArray *sectionObjects = [indexedObjects objectAtIndex:section];
    return [NSIndexPath indexPathForRow:[sectionObjects indexOfObject:object] inSection:section];
  }
  return [NSIndexPath indexPathForRow:[self.objects indexOfObject:object] inSection:0];
}

@end

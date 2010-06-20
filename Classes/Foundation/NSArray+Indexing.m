//
//  NSArray+Indexing.m
//  TellYouGov
//
//  Created by James Adam on 16/02/2010.
//  Copyright 2010 Lazyatom Limited. All rights reserved.
//

#import "NSArray+Indexing.h"


@implementation NSArray (Indexing)

- (NSArray *)indexUsingCollation:(UILocalizedIndexedCollation *)collation withSelector:(SEL)selector;
{
	NSMutableArray *indexedCollection;
	
	NSInteger index, sectionTitlesCount = [[collation sectionTitles] count];  
	indexedCollection = [[NSMutableArray alloc] initWithCapacity:sectionTitlesCount];
	
	for (index = 0; index < sectionTitlesCount; index++) {
		NSMutableArray *array = [[NSMutableArray alloc] init];
		[indexedCollection addObject:array];
		[array release];
	}
	
	// Segregate the data into the appropriate section
	for (id object in self) {
		NSInteger sectionNumber = [collation sectionForObject:object collationStringSelector:selector];
		[[indexedCollection objectAtIndex:sectionNumber] addObject:object];
	}
	
	// Now that all the data's in place, each section array needs to be sorted.
	for (index = 0; index < sectionTitlesCount; index++) {
		NSMutableArray *arrayForSection = [indexedCollection objectAtIndex:index];
		
		NSArray *sortedArray = [collation sortedArrayFromArray:arrayForSection collationStringSelector:selector];
		[indexedCollection replaceObjectAtIndex:index withObject:sortedArray];
	} 
	NSArray *immutableCollection = [indexedCollection copy];
	[indexedCollection release];
	
	return [immutableCollection autorelease];
}

@end

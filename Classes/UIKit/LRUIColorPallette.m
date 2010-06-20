//
//  UIColorPallette.m
//  LRToolkit
//
//  Created by Luke Redpath on 20/06/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import "LRUIColorPallette.h"


@implementation LRUIColorPallette

- (id)init;
{
  if (self = [super init]) {
    colors = [[NSMutableDictionary alloc] init];
  }
  return self;
}

- (void)dealloc;
{
  [colors release];
  [super dealloc];
}

- (void)setColor:(UIColor *)color forName:(NSString *)name;
{
  [colors setObject:color forKey:name];
}

- (UIColor *)colorForName:(NSString *)name;
{
  return [colors objectForKey:name];
}

@end

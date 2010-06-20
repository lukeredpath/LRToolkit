//
//  NSURL+StringFormat.m
//  Camppad
//
//  Created by Luke Redpath on 01/05/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import "NSURL+StringFormat.h"


@implementation NSURL (StringFormat)

- (id)initWithFormat:(NSString *)formatString, ...;
{
  va_list args;
  va_start(args, formatString);
  self = [self initWithFormat:formatString arguments:args];
  va_end(args);
  return self;
}

- (id)initWithFormat:(NSString *)formatString arguments:(va_list)args;
{
  NSString *urlString = [[NSString alloc] initWithFormat:formatString arguments:args];
  self = [self initWithString:urlString];
  [urlString release];
  return self;
}

+ (id)URLWithFormat:(NSString *)formatString, ...;
{
  va_list args;
  va_start(args, formatString);
  NSURL *url = [[self alloc] initWithFormat:formatString arguments:args];
  va_end(args);
  return [url autorelease];
}

+ (id)URLWithFormat:(NSString *)formatString relativeToURL:(NSURL *)baseURL, ...;
{
  va_list args;
  va_start(args, baseURL);
  NSString *path = [[NSString alloc] initWithFormat:formatString arguments:args];
  NSURL *url = [self URLWithString:path relativeToURL:baseURL];
  [path release];
  va_end(args);
  return url;
}

@end

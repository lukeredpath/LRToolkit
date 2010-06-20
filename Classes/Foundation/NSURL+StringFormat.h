//
//  NSURL+StringFormat.h
//  Camppad
//
//  Created by Luke Redpath on 01/05/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSURL (StringFormat)
- (id)initWithFormat:(NSString *)formatString, ...;
- (id)initWithFormat:(NSString *)formatString arguments:(va_list)args;
+ (id)URLWithFormat:(NSString *)formatString, ...;
+ (id)URLWithFormat:(NSString *)formatString relativeToURL:(NSURL *)baseURL, ...;
@end

//
//  NSString+FileSize.m
//  Spark
//
//  Created by Luke Redpath on 22/05/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import "NSString+FileSize.h"

@implementation NSString (FileSize)

+ (NSString *)fileSizeStringFromByes:(int)bytes;
{
  float floatSize = (float)bytes;
  
	if (bytes<1023)
		return([NSString stringWithFormat:@"%d bytes",bytes]);
	floatSize = floatSize / 1024;
	if (floatSize<1023)
		return([NSString stringWithFormat:@"%1.1f KB",floatSize]);
	floatSize = floatSize / 1024;
	if (floatSize<1023)
		return([NSString stringWithFormat:@"%1.1f MB",floatSize]);
	floatSize = floatSize / 1024;
  
	return([NSString stringWithFormat:@"%1.1f GB",floatSize]);
  
}

@end

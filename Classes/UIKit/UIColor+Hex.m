//
//  UIColor+Hex.m
//  LRToolkit
//
//  Created by Luke Redpath on 27/04/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//
//  Based on code from
//  http://pessoal.org/blog/2008/11/27/creating-uicolor-objects-from-hex-values/

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHexValue:(int)rgbValue;
{
  return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 
                         green:((float)((rgbValue & 0xFF00) >> 8))/255.0 
                          blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}

@end

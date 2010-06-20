//
//  UIColor+Hex.h
//  LRToolkit
//
//  Created by Luke Redpath on 27/04/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//
//  Based on code from
//  http://pessoal.org/blog/2008/11/27/creating-uicolor-objects-from-hex-values/

#import <UIKit/UIKit.h>


@interface UIColor (Hex)

+ (UIColor *)colorWithHexValue:(int)hexValue;

@end

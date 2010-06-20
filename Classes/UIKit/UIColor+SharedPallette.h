//
//  UIColor+SharedPallette.h
//  LRToolkit
//
//  Created by Luke Redpath on 20/06/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LRUIColorPallette;

@interface UIColor (SharedPallette)

+ (LRUIColorPallette *)sharedPallette;
+ (void)registerPalletteColorsUsingHexValuesFromDictionary:(NSDictionary *)palletteDictionary;
+ (void)registerPalletteColorsUsingHexValuesFromFile:(NSString *)fileName;
+ (void)registerPalletteColor:(UIColor *)color name:(NSString *)name;
+ (UIColor *)palletteColorNamed:(NSString *)name;
- (void)registerWithSharedPalletteUsingName:(NSString *)name;

@end

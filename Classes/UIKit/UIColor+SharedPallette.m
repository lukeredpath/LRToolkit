//
//  UIColor+SharedPallette.m
//  LRToolkit
//
//  Created by Luke Redpath on 20/06/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import "UIColor+SharedPallette.h"
#import "LRUIColorPallette.h"
#import "UIColor+Hex.h"
#import "LRFoundationMacros.h"

@implementation UIColor (SharedPallette)

static LRUIColorPallette *lr_sharedUIColorPallette = nil;

+ (LRUIColorPallette *)sharedPallette;
{
  if (lr_sharedUIColorPallette == nil) {
    lr_sharedUIColorPallette = [[LRUIColorPallette alloc] init];
  }
  return lr_sharedUIColorPallette;
}

/*
 * Registers colors from a dictionary of Name => Hex values
 * e.g.
 *   [NSDictionary 
        dictionaryWithObjects:[NSArray arrayWithObjects:LR_NSNUM(0xFFFFFF), LR_NSNUM(0x000000), nil]
                      forKeys:[NSArray arrayWithObjects:@"White", @"Black", nil]];
 */
+ (void)registerPalletteColorsUsingHexValuesFromDictionary:(NSDictionary *)palletteDictionary;
{
  for (NSString *colorName in [palletteDictionary allKeys]) {
    int hexValue = [[palletteDictionary objectForKey:colorName] intValue];
    [[self colorWithHexValue:hexValue] registerWithSharedPalletteUsingName:colorName];
  }
}

/*
 * Uses the same dictionary format as above but loaded from a plist file 
 */
+ (void)registerPalletteColorsUsingHexValuesFromFile:(NSString *)fileName;
{
  NSDictionary *palletteDictionary = [NSDictionary dictionaryWithContentsOfFile:fileName];
  if (palletteDictionary) {
    [self registerPalletteColorsUsingHexValuesFromDictionary:palletteDictionary];
  }
}

+ (void)registerPalletteColor:(UIColor *)color name:(NSString *)name;
{
  [[self sharedPallette] setColor:color forName:name];
}

+ (UIColor *)palletteColorNamed:(NSString *)name;
{
  return [[self sharedPallette] colorForName:name];
}

- (void)registerWithSharedPalletteUsingName:(NSString *)name;
{
  [[self class] registerPalletteColor:self name:name];
}

@end

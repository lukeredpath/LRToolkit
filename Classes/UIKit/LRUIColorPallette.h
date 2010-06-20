//
//  UIColorPallette.h
//  LRToolkit
//
//  Created by Luke Redpath on 20/06/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LRUIColorPallette : NSObject {
  NSMutableDictionary *colors;
}
- (void)setColor:(UIColor *)color forName:(NSString *)name;
- (UIColor *)colorForName:(NSString *)name;
@end

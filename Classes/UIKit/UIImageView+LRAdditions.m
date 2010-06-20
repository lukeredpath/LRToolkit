//
//  UIImageView+ImageLoading.m
//  LRToolkig
//
//  Created by Luke Redpath on 18/05/2010.
//  Copyright 2010 LJR Software Limited. All rights reserved.
//

#import "UIImageView+LRAdditions.h"


@implementation UIImageView (LRAdditions)

+ (id)imageViewWithImageNamed:(NSString *)imageName;
{
  UIImage *image = [UIImage imageNamed:imageName];
  UIImageView *imageView = [[self alloc] initWithImage:image];
  return [imageView autorelease];
}

@end

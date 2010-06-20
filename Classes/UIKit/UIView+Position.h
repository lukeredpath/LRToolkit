//
//  UIView+Position.h
//  LRToolkit
//
//  Created by Tyler Neylon on 3/19/10.
//  Copyleft 2010 Bynomial.
//  http://bynomial.com/blog/?p=24
//

#import <Foundation/Foundation.h>


@interface UIView (Position)

@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGSize frameSize;

@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;

// Setting these modifies the origin but not the size.
@property (nonatomic) CGFloat frameRight;
@property (nonatomic) CGFloat frameBottom;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@end

//
//  Component2.m
//  DynamicCellDemo
//
//  Created by Sanjit Saluja on 3/3/16.
//  Copyright © 2016 Sanjit Saluja. All rights reserved.
//

#import "Component2.h"

@implementation Component2
@synthesize expanded = _expanded;

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(200, 200);
}
@end

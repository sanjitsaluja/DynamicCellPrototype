//
//  ExpandableView.m
//  DynamicCellDemo
//
//  Created by Sanjit Saluja on 3/3/16.
//  Copyright © 2016 Sanjit Saluja. All rights reserved.
//

#import "ExpandableView.h"
#import <PureLayout/PureLayout.h>

@interface ExpandableView()
@property (nonatomic, strong) NSArray<NSLayoutConstraint *> *allConstraints;
@end

@implementation ExpandableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.toggleButton = [[UIButton buttonWithType:UIButtonTypeSystem] configureForAutoLayout];
        [self.toggleButton addTarget:self action:@selector(toggled:) forControlEvents:UIControlEventTouchUpInside];
        [self.toggleButton setTitle:@"Toggle" forState:UIControlStateNormal];
        [self addSubview:self.toggleButton];
        [self setConstraintsForExpanded:NO];
    }
    return self;
}

- (void)toggled:(id)sender
{
    self.expanded = !self.expanded;
}

- (void)setExpanded:(BOOL)expanded
{
    if (_expanded != expanded)
    {
        _expanded = expanded;
        [self setConstraintsForExpanded:expanded];
    }
}

- (void)setConstraintsForExpanded:(BOOL)expanded
{
    [self.allConstraints autoRemoveConstraints];
    self.allConstraints = [NSLayoutConstraint autoCreateAndInstallConstraints:^{
        if (expanded)
        {
            [self addSubview:self.contentView];
            [self.contentView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(8, 8, 8, 8) excludingEdge:ALEdgeBottom];
            [self.toggleButton autoSetDimension:ALDimensionHeight toSize:50];
            [self.toggleButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.contentView withOffset:8];
            [self.toggleButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
            [self.toggleButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        }
        else
        {
            [self.contentView removeFromSuperview];
            [self.toggleButton autoSetDimension:ALDimensionHeight toSize:50];
            [self.toggleButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
            [self.toggleButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
            [self.toggleButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        }
    }];
}

@end

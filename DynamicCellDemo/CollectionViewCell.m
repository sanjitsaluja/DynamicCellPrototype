//
//  CollectionViewCell.m
//  DynamicCellDemo
//
//  Created by Sanjit Saluja on 3/3/16.
//  Copyright © 2016 Sanjit Saluja. All rights reserved.
//

#import "CollectionViewCell.h"
#import <PureLayout/PureLayout.h>

@interface CollectionViewCell()
@property (nonatomic, assign) CGSize cachedSize;
@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.borderColor = [UIColor greenColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setExpandableView:(ExpandableView *)expandableView
{
    if (_expandableView != expandableView)
    {
        [self.expandableView removeFromSuperview];
        [self.expandableView removeObserver:self forKeyPath:@"expanded"];
        _expandableView = [expandableView configureForAutoLayout];
        [self.contentView addSubview:expandableView];
        [self.expandableView addObserver:self forKeyPath:@"expanded" options:NSKeyValueObservingOptionNew context:NULL];
        [[self.expandableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom] autoInstallConstraints];
    }
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    CGSize desiredSize = [self desiredSizeWithWidth:layoutAttributes.frame.size.width];
    if (CGSizeEqualToSize(desiredSize, self.cachedSize))
    {
        return layoutAttributes;
    }
    CGRect newFrame = layoutAttributes.frame;
    newFrame.size = desiredSize;
    layoutAttributes.frame = newFrame;
    return layoutAttributes;
}

- (CGSize)desiredSizeWithWidth:(CGFloat)width
{
    CGSize size = [self.expandableView systemLayoutSizeFittingSize:CGSizeMake(width, CGFLOAT_MAX)];
    return CGSizeMake(width, size.height);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"expanded"])
    {
        [self.collectionView.collectionViewLayout invalidateLayout];

        void (^animateChangeHeight)() = ^()
        {
            CGRect frame = self.frame;
            CGSize size = [self desiredSizeWithWidth:self.bounds.size.width];
            frame.size = size;
            self.frame = frame;
        };

        // Animate
        [UIView transitionWithView:self.collectionView duration:0.1f options: UIViewAnimationOptionTransitionCrossDissolve animations:animateChangeHeight completion:nil];
    }
}

@end

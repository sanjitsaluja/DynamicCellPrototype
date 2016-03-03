//
//  CollectionViewController.m
//  DynamicCellDemo
//
//  Created by Sanjit Saluja on 3/3/16.
//  Copyright © 2016 Sanjit Saluja. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "Component1.h"
#import "Component2.h"
#import "ExpandableView.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Register cell classes
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.flowLayout.estimatedItemSize = CGSizeMake(self.view.bounds.size.width, 100);
}

#pragma mark <Convenience>

- (UICollectionViewFlowLayout *)flowLayout
{
    return (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.collectionView = collectionView;
    ExpandableView *expandableView = [[ExpandableView alloc] initWithFrame:CGRectZero];
    [expandableView.toggleButton setTitle:[NSString stringWithFormat:@"Toggle Item %lu", indexPath.item] forState:UIControlStateNormal];

    if (indexPath.item == 0)
    {
        Component1 *contentView1 = [[[NSBundle mainBundle] loadNibNamed:@"Component1" owner:self options:nil] objectAtIndex:0];
        [expandableView setContentView:contentView1];
    }
    else
    {
        Component2 *contentView1 = [[[NSBundle mainBundle] loadNibNamed:@"Component2" owner:self options:nil] objectAtIndex:0];
        [expandableView setContentView:contentView1];
        
    }
    [cell setExpandableView:expandableView];
    return cell;
}


@end

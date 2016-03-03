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
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.collectionView = collectionView;
    Component1 *rootView = [[[NSBundle mainBundle] loadNibNamed:@"Component1" owner:self options:nil] objectAtIndex:0];
    [rootView.toggleButton setTitle:[NSString stringWithFormat:@"Toggle Item %lu", indexPath.item] forState:UIControlStateNormal];
    [cell setComponentView:rootView];
    return cell;
}


@end

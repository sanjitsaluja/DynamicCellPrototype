//
//  CollectionViewCell.h
//  DynamicCellDemo
//
//  Created by Sanjit Saluja on 3/3/16.
//  Copyright © 2016 Sanjit Saluja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExpandableView.h"

@interface CollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) ExpandableView *expandableView;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

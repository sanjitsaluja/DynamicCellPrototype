//
//  ExpandableView.h
//  DynamicCellDemo
//
//  Created by Sanjit Saluja on 3/3/16.
//  Copyright © 2016 Sanjit Saluja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExpandableViewTraits.h"

@interface ExpandableView : UIView
@property (nonatomic, strong) UIButton *toggleButton;
@property (nonatomic, assign) BOOL expanded;
@property (nonatomic, strong) UIView<ExpandableViewTraits> *contentView;
@end

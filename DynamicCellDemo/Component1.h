//
//  Component1.h
//  DynamicCellDemo
//
//  Created by Sanjit Saluja on 3/3/16.
//  Copyright © 2016 Sanjit Saluja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExpandableView.h"

@interface Component1 : UIView<ExpandableView>
@property (nonatomic, weak) IBOutlet UIButton *toggleButton;
@end

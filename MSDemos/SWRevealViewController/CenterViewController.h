//
//  CenterViewController.h
//  MSDemos
//
//  Created by mr.scorpion on 16/8/10.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSUInteger, Type) {
    None,
    TableViewType,
    CollectionViewType
};

@interface CenterViewController : BaseViewController
@property (nonatomic, assign) Type type;
@end

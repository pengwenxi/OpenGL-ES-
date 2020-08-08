//
//  FilterBar.h
//  滤镜处理
//
//  Created by 彭文喜 on 2020/8/7.
//  Copyright © 2020 彭文喜. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FilterBar;
@protocol FilterBarDelegate <NSObject>

-(void)filterBar:(FilterBar *)filterBar didScrollToIndex:(NSUInteger)index;

@end
NS_ASSUME_NONNULL_BEGIN

@interface FilterBar : UIView

@property(nonatomic,strong)NSArray <NSString *>*itemList;

@property(nonatomic,weak)id<FilterBarDelegate>delegate;
@end

NS_ASSUME_NONNULL_END

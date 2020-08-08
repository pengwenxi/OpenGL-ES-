//
//  FilterBarCell.h
//  滤镜处理
//
//  Created by 彭文喜 on 2020/8/7.
//  Copyright © 2020 彭文喜. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface FilterBarCell : UICollectionViewCell

@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)BOOL isSelect;
@end

NS_ASSUME_NONNULL_END

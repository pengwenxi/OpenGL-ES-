//
//  FilterBar.m
//  滤镜处理
//
//  Created by 彭文喜 on 2020/8/7.
//  Copyright © 2020 彭文喜. All rights reserved.
//

#import "FilterBar.h"
#import "FilterBarCell.h"

@interface FilterBar()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,assign)NSInteger currentIndex;
@end

@implementation FilterBar


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self initUI];
    }
    return self;
}

-(void)initUI{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    CGFloat itemW = 100;
    CGFloat itemH = CGRectGetHeight(self.frame);
    flowLayout.itemSize = CGSizeMake(itemW, itemH);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _flowLayout = flowLayout;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
    [self addSubview:_collectionView];
    
    _collectionView.backgroundColor = UIColor.whiteColor;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[FilterBarCell class] forCellWithReuseIdentifier:@"CELL"];


}

-(void)selectIndex:(NSIndexPath *)indexPath{
    _currentIndex = indexPath.row;
    [_collectionView reloadData];
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(filterBar:didScrollToIndex:)]){
        [self.delegate filterBar:self didScrollToIndex:indexPath.row];
    }
}

-(void)setItemList:(NSArray<NSString *> *)itemList{
    _itemList = itemList;
    [_collectionView reloadData];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_itemList count];
}
-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FilterBarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    cell.title = self.itemList[indexPath.row];
    cell.isSelect = indexPath.row == _currentIndex;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self selectIndex:indexPath];
}
@end

//
//  ContainScrollView.h
//  NestedTableView
//
//  Created by wangyahui on 2021/3/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContainTableViceCellView : UITableViewCell

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) BOOL cellCanScroll;

@end

NS_ASSUME_NONNULL_END

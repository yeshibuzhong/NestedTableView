//
//  TableViewHeader.m
//  NestedTableView
//
//  Created by wangyahui on 2021/3/26.
//

#import "TableViewHeader.h"

@implementation TableViewHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
  self = [super initWithReuseIdentifier:reuseIdentifier];
  if (self) {
    [self setSubviews];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if (self) {
    [self setSubviews];
  }
  return self;
}

- (instancetype)init{
  self = [super init];
  if (self) {
    [self setSubviews];
  }
  return self;
}

- (void)setSubviews{
  [self addSubview:self.titleLbl];
  self.titleLbl.frame = CGRectMake(15, 0, [UIScreen mainScreen].bounds.size.width, 40);
}

#pragma mark --- 懒加载
- (UILabel *)titleLbl{
  if (_titleLbl == nil) {
    _titleLbl = [UILabel new];
  }
  return _titleLbl;
}

@end

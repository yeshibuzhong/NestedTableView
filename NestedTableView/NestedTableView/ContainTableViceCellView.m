//
//  ContainScrollView.m
//  NestedTableView
//
//  Created by wangyahui on 2021/3/26.
//

#import "ContainTableViceCellView.h"
#import "SubTableView.h"
#import "MainScrollView.h"

@interface ContainTableViceCellView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) SubTableView *tableview1;
@property (nonatomic, strong) SubTableView *tableview2;

@end

@implementation ContainTableViceCellView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)setCellHeight:(CGFloat)cellHeight{
  if (_cellHeight > 0) {
    return;
  }
  _cellHeight = cellHeight;
  [self setChilds];
}

- (void)setCellCanScroll:(BOOL)cellCanScroll{
    _cellCanScroll = cellCanScroll;
    _tableview1.canScroll = cellCanScroll;
    _tableview2.canScroll = cellCanScroll;
}

- (void)setChilds{
    MainScrollView * scrollView = [[MainScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(2 * scrollView.bounds.size.width, scrollView.bounds.size.height);
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor greenColor];
    
    _tableview1 = [[SubTableView alloc] initWithFrame:CGRectMake(0, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
    [scrollView addSubview:_tableview1];
    
    _tableview2 = [[SubTableView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
    [scrollView addSubview:_tableview2];
}


@end

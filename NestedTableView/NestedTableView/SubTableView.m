//
//  SubTableView.m
//  NestedTableView
//
//  Created by wangyahui on 2021/3/26.
//

#import "SubTableView.h"


@interface SubTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;

@end


@implementation SubTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tableview = [[UITableView alloc] initWithFrame:self.bounds];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor = [UIColor yellowColor];
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [self addSubview:_tableview];
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_canScroll) {
        NSLog(@"😄😄😄😄😄😄😄😄");
    }else{
        _tableview.contentOffset = CGPointZero;
    }
    if (_tableview.contentOffset.y < 0) {
        _canScroll = NO;
        _tableview.contentOffset = CGPointZero;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"mainCanScroll" object:nil];//到顶通知父视图改变状态
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
  cell.textLabel.text = [NSString stringWithFormat:@"%lu", indexPath.row];
  return cell;
}

@end

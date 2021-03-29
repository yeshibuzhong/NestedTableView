//
//  ViewController.m
//  NestedTableView
//
//  Created by wangyahui on 2021/3/26.
//

#import "ViewController.h"
#import "MainTableView.h"
#import "ContainTableViceCellView.h"
#import "TableViewHeader.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) MainTableView *tableView;
@property (nonatomic, assign) BOOL canScroll;
@property (nonatomic, strong) ContainTableViceCellView *subCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"";
    self.canScroll = YES;
    
    [self.view addSubview:self.tableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"mainCanScroll" object:nil];
}

// 主视图可以滚动的通知
- (void)changeScrollStatus{
    self.canScroll = YES;
    self.subCell.cellCanScroll = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat bottomCellOffset = [self.tableView rectForSection:1].origin.y;
    if (scrollView.contentOffset.y >= bottomCellOffset) {   // 第二个sectionHeaderView滑动到顶部
        scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
        self.canScroll = NO;
        self.subCell.cellCanScroll = YES;
    }else{
        if (!self.canScroll) {
            scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 20;
    } else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    if (section == 0) {
        return 44;
    } else {
        CGFloat statusH = [UIApplication sharedApplication].statusBarFrame.size.height;
        CGFloat cellHeight = [UIScreen mainScreen].bounds.size.height -  statusH - 40;
        return cellHeight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    if (section == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"第%lu区  第%lu行", indexPath.section, indexPath.row];
        return cell;
    }else{
        ContainTableViceCellView * cell = [tableView dequeueReusableCellWithIdentifier:@"ContainTableViceCellView" forIndexPath:indexPath];
        CGFloat statusH = [UIApplication sharedApplication].statusBarFrame.size.height;
        CGFloat cellHeight = [UIScreen mainScreen].bounds.size.height -  statusH - 40;
        cell.cellHeight = cellHeight;
        self.subCell = cell;
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TableViewHeader * header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"TableViewHeader"];
    header = [[TableViewHeader alloc] initWithReuseIdentifier:@"TableViewHeader"];
    header.contentView.backgroundColor = [UIColor redColor];
    header.titleLbl.text = [NSString stringWithFormat:@"第%lu个分区", section];
    header.titleLbl.backgroundColor = [UIColor greenColor];
    if (section == 1) {
        header.titleLbl.text = @"分区下嵌套了多个tableview，可以左右滑动";
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (MainTableView *)tableView{
    if (_tableView == nil) {
        CGFloat statusH = [UIApplication sharedApplication].statusBarFrame.size.height;
        _tableView = [[MainTableView alloc] initWithFrame:CGRectMake(0, statusH, self.view.frame.size.width, self.view.frame.size.height  - statusH) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [_tableView registerClass:[TableViewHeader class] forHeaderFooterViewReuseIdentifier:@"TableViewHeader"];
        [_tableView registerClass:[ContainTableViceCellView class] forCellReuseIdentifier:@"ContainTableViceCellView"];
    }
    return _tableView;
}


@end

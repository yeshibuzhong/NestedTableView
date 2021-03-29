//
//  MainTableView.m
//  NestedTableView
//
//  Created by wangyahui on 2021/3/26.
//

#import "MainTableView.h"
#import "MainScrollView.h"

@implementation MainTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
   if ([otherGestureRecognizer.view isKindOfClass:[MainScrollView class]]) {
        return NO;
    }
    return YES;
}

@end

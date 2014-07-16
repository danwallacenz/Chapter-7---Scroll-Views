//
//  ScrollViewInStoryboardViewController.m
//  Chapter 7 - Scroll Views
//
//  Created by Daniel Wallace [DATACOM] on 16/07/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ScrollViewInStoryboardViewController.h"

@interface ScrollViewInStoryboardViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ScrollViewInStoryboardViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.delegate = self;
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    
    // Compensate for tabbar and slightly move down for status bar.
    self.scrollView.contentInset = UIEdgeInsetsMake(10, 0, 50, 0);
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.scrollView flashScrollIndicators];
}

#pragma mark - UIScrollViewDelegate

#pragma mark Responding to Scrolling and Dragging

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"UIScrollViewDelegate scrollViewDidScroll - bounds origin: %@",  NSStringFromCGPoint(scrollView.bounds.origin));
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"UIScrollViewDelegate scrollViewWillBeginDragging ");
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"UIScrollViewDelegate  scrollViewWillEndDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"UIScrollViewDelegate  scrollViewDidEndDragging");
}

-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"UIScrollViewDelegate  scrollViewShouldScrollToTop");
    return YES;
}


- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"UIScrollViewDelegate scrollViewDidScrollToTop ");
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"UIScrollViewDelegate  scrollViewWillBeginDecelerating");
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"UIScrollViewDelegate  scrollViewDidEndDecelerating");
}

#pragma mark Managing Zooming

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"UIScrollViewDelegate  viewForZoomingInScrollView");
    return self.contentView;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    NSLog(@"UIScrollViewDelegate  scrollViewWillBeginZooming");
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"UIScrollViewDelegate  scrollViewDidEndZooming");
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"UIScrollViewDelegate  scrollViewDidZoom");
}

#pragma mark Responding to Scrolling Animations

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"UIScrollViewDelegate  scrollViewDidEndScrollingAnimation");
}

-(NSString *)diagnostics
{
    NSString *diagnostics = @"";
    NSString *contentSize = NSStringFromCGSize(self.scrollView.contentSize);
    NSString *contentOffset = NSStringFromCGPoint(self.scrollView.contentOffset);
    NSString *bounds = NSStringFromCGRect(self.scrollView.bounds);
    NSString *contentInset = NSStringFromUIEdgeInsets(self.scrollView.contentInset);
    NSString *decelerating = [NSString stringWithFormat:@"%@", self.scrollView.decelerating?@"yes":@"no"];

    diagnostics = [diagnostics stringByAppendingString:contentSize];
    diagnostics = [diagnostics stringByAppendingString:contentOffset];
    diagnostics = [diagnostics stringByAppendingString:bounds];
    diagnostics = [diagnostics stringByAppendingString:contentInset];
    diagnostics = [diagnostics stringByAppendingString:decelerating];
    
    return diagnostics;
}

@end

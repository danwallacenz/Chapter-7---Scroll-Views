//
//  ContenViewViewController.m
//  Chapter 7 - Scroll Views
//
//  Created by Daniel Wallace [DATACOM] on 16/07/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ContentViewViewController.h"

@interface ContentViewViewController ()

@property (weak, nonatomic) IBOutlet UIView *scrollViewContainer0;
@property (weak, nonatomic) IBOutlet UIView *scrollViewContainer1;
@property (weak, nonatomic) IBOutlet UIView *scrollViewContainer2;
@property (weak, nonatomic) IBOutlet UIView *scrollViewContainer3;

@end

@implementation ContentViewViewController

const float LABEL_COUNT = 50;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create four scroll views with content views with different colors.
    [self createScrollViewInView:self.scrollViewContainer0 withColor: [UIColor greenColor]];
    [self createScrollViewInView:self.scrollViewContainer1 withColor: [UIColor redColor]];
    [self createScrollViewInView:self.scrollViewContainer2 withColor: [UIColor blueColor]];
    [self createScrollViewInView:self.scrollViewContainer3 withColor: [UIColor orangeColor]];
 
    // Set content view frame and scroll view contentSize explicitly.
    [self loadScrollViewWithNoConstraintsInView: self.scrollViewContainer0];
    
    // Set content view using explicit constraints, but its subviews don’t.
    [self loadScrollViewWithContentViewWithConstraintsButSubviewsDoNotInView: self.scrollViewContainer1];
    
}


/**
 Set content view frame and scroll view contentSize explicitly.
*/
-(void) loadScrollViewWithNoConstraintsInView: (UIView *)containerView
{
    CGFloat y = 10;
    
    UIScrollView *scrollView = containerView.subviews[0];
    UIView *contentView = scrollView.subviews[0];
    
    // Create labels, keep incrementing y.
    for (int i = 0; i < LABEL_COUNT; i++) {
        UILabel *label = [UILabel new];
        label.text = [NSString stringWithFormat: @"No constraints %d", i+1 ];
        
        [label sizeToFit];
        
        CGRect labelFrame = label.frame;
        labelFrame.origin = CGPointMake(10, y);
        label.frame = labelFrame;
        
        label.backgroundColor = contentView.backgroundColor;
        
        [contentView addSubview:label];
        y += label.bounds.size.height + 10;
    }
    
    // Set content view frame and scroll view contentSize explicitly.
    if(contentView){
        contentView.frame = CGRectMake(0, 0, 0, y);
        scrollView.contentSize = contentView.frame.size;
    }
}

/**
 Set content view using explicit constraints, but its subviews don’t.
 */
-(void) loadScrollViewWithContentViewWithConstraintsButSubviewsDoNotInView: (UIView *)containerView
{
    CGFloat y = 10;
    
    UIScrollView *scrollView = containerView.subviews[0];
    UIView *contentView = scrollView.subviews[0];
    
    for (int i = 0; i < LABEL_COUNT; i++) {
        UILabel *label = [UILabel new];
        label.text = [NSString stringWithFormat: @"ContentView uses constraints, labels don't %d", i+1 ];
        
        [label sizeToFit];
        
        CGRect labelFrame = label.frame;
        labelFrame.origin = CGPointMake(10, y);
        label.frame = labelFrame;
        
        label.backgroundColor = contentView.backgroundColor;

        [contentView addSubview:label];
        y += label.bounds.size.height + 10;
    }
    // Configure the content view using constraints.
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Pin contentView to the top and bottom of the scroll view with a height of y.
    [scrollView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[contentView(y)]|"
                                                                        options: 0
                                                                        metrics: @{@"y":@(y)}
                                                                          views: @{@"contentView": contentView}]];
    
    // Pin contentView to the left and right sides of the scroll view with a width of 0.
    [scrollView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[contentView(0)]|"
                                                                        options: 0
                                                                        metrics: nil
                                                                          views: @{@"contentView": contentView}]];
}


-(void) createScrollViewInView:(UIView *)containerView withColor: (UIColor *)color
{
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [containerView addSubview:scrollView];
    
    [containerView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|"
                                             options:0
                                             metrics:nil
                                               views:@{@"scrollView":scrollView}]];
    
    [containerView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|"
                                             options:0
                                             metrics:nil
                                               views:@{@"scrollView":scrollView}]];
    UIView *contentView = [UIView new];
    contentView.backgroundColor = color;
    [scrollView addSubview:contentView];
    contentView.frame =CGRectMake(0, 0, 100, 100); // sanity check - remove this
}


@end

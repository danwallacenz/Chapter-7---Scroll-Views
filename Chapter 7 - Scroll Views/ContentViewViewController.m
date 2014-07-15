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
    // Do any additional setup after loading the view.
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollViewContainer0 addSubview:scrollView];
    
    [self.scrollViewContainer0 addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|"
                                             options:0
                                             metrics:nil
                                               views:@{@"scrollView":scrollView}]];
    
    [self.scrollViewContainer0 addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|"
                                             options:0
                                             metrics:nil
                                               views:@{@"scrollView":scrollView}]];
    UIView *contentView = [UIView new];
    contentView.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:contentView];
//    contentView.frame =CGRectMake(0, 0, 100, 100);
 
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
    contentView.frame =CGRectMake(0, 0, 100, 100);
}


@end

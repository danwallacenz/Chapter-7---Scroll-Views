//
//  ViewController.m
//  Chapter 7 - Scroll Views
//
//  Created by Daniel Wallace [DATACOM] on 28/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property int LABEL_COUNT;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic)UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISwitch *uiViewAutoresizingFlexibleWidthSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *uiViewAutoresizingFlexibleHeightSwitch;

@end

@implementation ViewController
- (IBAction)uiViewAutoresizingFlexibleWidthToggled:(UISwitch *)sender
{
//    [self.scrollView removeFromSuperview];
//    self.scrollView = nil;
//    
//    [self addScrollViewUsingAutoresizingMask];
//    if(!sender.on){
//        self.scrollView.backgroundColor = [UIColor greenColor];
//    }else{
//        self.scrollView.backgroundColor = [UIColor redColor];
//    }
//    
//    [self.view setNeedsDisplay];
}

- (IBAction)uiViewAutoresizingFlexibleHeightToggled:(UISwitch *)sender
{
//    [self.scrollView removeFromSuperview];
//    self.scrollView = nil;
//    
//    [self addScrollViewUsingAutoresizingMask];
//    if(!sender.on){
//        self.scrollView.backgroundColor = [UIColor yellowColor];
//    }else{
//        self.scrollView.backgroundColor = [UIColor redColor];
//    }
//    
//    [self.view setNeedsDisplay];

}

- (void) addScrollViewUsingConstraints
{
    self.scrollView = [UIScrollView new];
    self.scrollView.backgroundColor = [UIColor lightGrayColor];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // scrollView border
    self.scrollView.layer.masksToBounds = YES;
    self.scrollView.layer.borderColor = [UIColor blueColor].CGColor;
    self.scrollView.layer.borderWidth = 2;
    
    
    [self.contentView addSubview:self.scrollView];
    self.contentView.backgroundColor = [UIColor redColor];
    
    UIScrollView *localScrollView = self.scrollView;
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[localScrollView]|" options:0 metrics:nil views:@{@"localScrollView":localScrollView}]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[localScrollView]|" options:0 metrics:nil views:@{@"localScrollView":localScrollView}]];
    
    UILabel *previousLabel = nil;
    UILabel *label = nil;
    for (int i = 0; i < self.LABEL_COUNT; i++) {
        label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.text = [NSString stringWithFormat:@"This is label %d", i + 1];
        label.backgroundColor = [UIColor darkGrayColor];
        
        [self.scrollView addSubview:label];

        
        // label border
        label.layer.masksToBounds = YES;
        label.layer.borderColor = [UIColor redColor].CGColor;
        label.layer.borderWidth = 2;
        
        
        
//        NSString *labelHorizontalLayout = @"H:|-(10)-[label]-(10)-|";
        NSString *labelHorizontalLayout = @"H:|-[label]-|";
        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat: labelHorizontalLayout options:0 metrics:nil views:@{@"label":label}]];
        
        if(!previousLabel){ // first one, pin to top
            [localScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(10)-[label]" options:0 metrics:nil views:@{@"label":label}]];
        }else{              // all others, pin to previous
            [localScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[prev]-(10)-[label]" options:0 metrics:nil views:@{@"label":label, @"prev": previousLabel}]];
        }
        previousLabel = label;
    }
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-(10)-|" options:0 metrics:nil views:@{ @"label": previousLabel}]];
    
    NSLog(@"scrollView bounds: height = %f, width = %f", self.scrollView.bounds.size.height, self.scrollView.bounds.size.width);
}

- (void)addScrollViewUsingAutoresizingMask
{
    
    CGRect scrollViewFrame = self.contentView.bounds;
    scrollViewFrame.size.height = scrollViewFrame.size.height - 20;
    scrollViewFrame.size.width = scrollViewFrame.size.width - 20;
    scrollViewFrame.origin = CGPointMake(10,10);
    
    self.scrollView = [[UIScrollView alloc]initWithFrame: scrollViewFrame];
                       
//    self.scrollView = [[UIScrollView alloc]initWithFrame: self.contentView.bounds];
    
    UIViewAutoresizing uiViewAutoresizing;
    if(self.uiViewAutoresizingFlexibleWidthSwitch.on && self.uiViewAutoresizingFlexibleHeightSwitch.on){
        uiViewAutoresizing = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    }else if(self.uiViewAutoresizingFlexibleWidthSwitch.on && !self.uiViewAutoresizingFlexibleHeightSwitch.on){
        uiViewAutoresizing = UIViewAutoresizingFlexibleWidth;
    }else if(!self.uiViewAutoresizingFlexibleWidthSwitch.on && self.uiViewAutoresizingFlexibleHeightSwitch.on){
        uiViewAutoresizing = UIViewAutoresizingFlexibleHeight;
    }
    
//    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.scrollView. autoresizingMask = uiViewAutoresizing;
    
    [self.contentView addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor lightGrayColor];

    
//    self.scrollView.backgroundColor = [UIColor redColor];
    CGFloat y = 10;
    for (int i=0; i<self.LABEL_COUNT; i++) {
        
        UILabel *label = [UILabel new];
        
        label.text = [NSString stringWithFormat:@"This is label %d", i + 1];
        [label sizeToFit];
        CGRect labelFrame = label.frame;
        labelFrame.origin = CGPointMake(10,y);
        
//        labelFrame.size.width = self.contentView.bounds.size.width - 20;
        label.frame = labelFrame;
        label.backgroundColor = [UIColor lightGrayColor];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        [self.scrollView addSubview:label];
        y += label.bounds.size.height + 10;
    }
    CGSize contentSize = self.scrollView.bounds.size;
    contentSize.height = y;
    self.scrollView.contentSize = contentSize;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     [self addScrollViewUsingConstraints];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.LABEL_COUNT = 50;
    
#define which 2
    
#if which==1
    
    [self addScrollViewUsingAutoresizingMask];
    
#elif which==2
    
//    [self addScrollViewUsingConstraints];
    
#endif
    
//    [self addTestLabel];
}

- (void) addTestLabel
{
    UIView *labelContainer = [UIView new];
    labelContainer.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:labelContainer];
    labelContainer.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-350-[labelContainer]-450-|" options:0 metrics:nil views:@{@"labelContainer":labelContainer}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-200-[labelContainer]-200-|" options:0 metrics:nil views:@{@"labelContainer":labelContainer}]];
    
    UILabel *testLabel = [UILabel new];
    testLabel.backgroundColor = [UIColor redColor];
    testLabel.text = @"testLabel";
    testLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [labelContainer addSubview:testLabel];
    //
    [labelContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[testLabel]-10-|" options:0 metrics:nil views:@{@"testLabel":testLabel}]];
    [labelContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[testLabel]" options:0 metrics:nil views:@{@"testLabel":testLabel}]];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

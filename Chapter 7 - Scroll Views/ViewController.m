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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.LABEL_COUNT = 50;
    
#define which 1
    
#if which==1
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame: self.view.bounds];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:scrollView];
    scrollView.backgroundColor = [UIColor whiteColor];
    CGFloat y = 10;
    for (int i=0; i<self.LABEL_COUNT; i++) {
        UILabel *label = [UILabel new];
       
        label.text = [NSString stringWithFormat:@"This is label %d", i + 1];
        [label sizeToFit];
        CGRect labelFrame = label.frame;
        labelFrame.origin = CGPointMake(10,y);
        
        labelFrame.size.width = self.view.bounds.size.width - 20;
        label.frame = labelFrame;
        label.backgroundColor = [UIColor lightGrayColor];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        [scrollView addSubview:label];
        y += label.bounds.size.height + 10;
    }
    CGSize contentSize = scrollView.bounds.size;
    contentSize.height = y;
    scrollView.contentSize = contentSize;
    
#elif which==2
    
    
    
#endif
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

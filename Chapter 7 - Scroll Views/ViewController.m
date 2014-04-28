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
    [self.scrollView removeFromSuperview];
    self.scrollView = nil;
    
    [self addScrollViewUsingAutoresizingMask];
    if(!sender.on){
        self.scrollView.backgroundColor = [UIColor greenColor];
    }else{
        self.scrollView.backgroundColor = [UIColor redColor];
    }
    
    [self.view setNeedsDisplay];
}

- (IBAction)uiViewAutoresizingFlexibleHeightToggled:(UISwitch *)sender
{
    [self.scrollView removeFromSuperview];
    self.scrollView = nil;
    
    [self addScrollViewUsingAutoresizingMask];
    if(!sender.on){
        self.scrollView.backgroundColor = [UIColor yellowColor];
    }else{
        self.scrollView.backgroundColor = [UIColor redColor];
    }
    
    [self.view setNeedsDisplay];

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
    
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//    self.scrollView. autoresizingMask = uiViewAutoresizing;
    
    [self.contentView addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor blueColor];

    
    self.scrollView.backgroundColor = [UIColor redColor];
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


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.LABEL_COUNT = 50;
    
#define which 1
    
#if which==1
    
    [self addScrollViewUsingAutoresizingMask];
    
#elif which==2
    
    
    
#endif
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

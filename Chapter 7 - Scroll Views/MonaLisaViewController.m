//
//  MonaLisaViewController.m
//  Chapter 7 - Scroll Views
//
//  Created by Daniel Wallace on 17/07/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "MonaLisaViewController.h"

@interface MonaLisaViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation MonaLisaViewController

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
    
    self.view.backgroundColor = [UIColor greenColor];
    
    // Add scroll view.
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: scrollView];
    
    [self.view addConstraints:
        [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-(0)-[scrollView]-(0)-|"
                                                options:0
                                                metrics:nil
                                                  views:@{@"scrollView":scrollView}]];
    [self.view addConstraints:
        [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-(0)-[scrollView]-(0)-|"
                                             options:0
                                             metrics:nil
                                               views:@{@"scrollView":scrollView}]];
    
    // Add image.
    UIImage *monaLisa = [UIImage imageNamed:@"Mona_Lisa"];
    
    // Add image view.
    UIImageView *imageView = [UIImageView new];
    [imageView setImage: monaLisa];

    
    imageView.contentScaleFactor = 0;
    
    [scrollView addSubview:imageView];
    
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    imageView.contentMode = UIViewContentModeScaleToFill;

    UIInterfaceOrientation currentOrientation = [self currentDeviceOrientation];
    CGFloat widthOfView;
    if(currentOrientation == UIInterfaceOrientationPortrait){
        widthOfView = MIN(self.view.bounds.size.height, self.view.bounds.size.width); // portrait
    }else{
        widthOfView = MAX(self.view.bounds.size.height, self.view.bounds.size.width); // landscape
    }
    CGFloat widthOfImage = MIN(monaLisa.size.height, monaLisa.size.width);
    
    
    CGFloat diff = (widthOfView - widthOfImage) / 2.0;
    
    NSDictionary *metrics = @{@"diff":@(diff)};
    [scrollView addConstraints:[
        NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(diff)-[imageView]-(diff)-|"
                                options:0
                                metrics:metrics
                                views:@{@"imageView":imageView}]];
    [scrollView addConstraints:[
                                NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[imageView]-(10)-|"
                                options:0
                                metrics:nil
                                views:@{@"imageView":imageView}]];
  
    self.scrollView = scrollView;
    self.imageView = imageView;
    

    
    NSLog(@"self.imageView.size = %@", NSStringFromCGSize(self.imageView.bounds.size));
    NSLog(@"self.scrollView.size =  %@",NSStringFromCGSize(self.scrollView.bounds.size));
    NSLog(@"image.size =  %@",NSStringFromCGSize(self.imageView.image.size));
    NSLog(@"view.size =  %@",NSStringFromCGSize(self.view.bounds.size));
    NSLog(@"");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"self.imageView.size = %@", NSStringFromCGSize(self.imageView.bounds.size));
    NSLog(@"self.scrollView.size =  %@",NSStringFromCGSize(self.scrollView.bounds.size));
    NSLog(@"image.size =  %@",NSStringFromCGSize(self.imageView.image.size));
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"self.imageView.size = %@", NSStringFromCGSize(self.imageView.bounds.size));
    NSLog(@"self.scrollView.size =  %@",NSStringFromCGSize(self.scrollView.bounds.size));
    NSLog(@"image.size =  %@",NSStringFromCGSize(self.imageView.image.size));
    NSLog(@"");
}


- (UIInterfaceOrientation)currentDeviceOrientation
{
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(orientation == 0){ //Default orientation
        //UI is in Default (Portrait) -- this is really a just a failsafe.
    }
    else if(orientation == UIInterfaceOrientationPortrait){
        //Do something if the orientation is in Portrait
    }
    else if(orientation == UIInterfaceOrientationLandscapeLeft){
        // Do something if Left
    }
    else if(orientation == UIInterfaceOrientationLandscapeRight){
        //Do something if right
    }
    
    return orientation;
}

@end

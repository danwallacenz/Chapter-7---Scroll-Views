//
//  MonaLisaViewController.m
//  Chapter 7 - Scroll Views
//
//  Created by Daniel Wallace on 17/07/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "MonaLisaViewController.h"

@interface MonaLisaViewController ()

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
    
//    NSLog(@"monaLisa size = %@", NSStringFromCGSize(monaLisa.size));
//    NSLog(@"monaLisa scale = %f", monaLisa.scale);
    
    // Add image view.
    UIImageView *imageView = [UIImageView new];
    [imageView setImage: monaLisa];
    imageView.bounds = CGRectMake(0, 0, monaLisa.size.width * monaLisa.scale, monaLisa.size.height * monaLisa.scale);
    
    imageView.contentScaleFactor = 0;
    
    [scrollView addSubview:imageView];
    
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    imageView.contentMode = UIViewContentModeScaleToFill;
    
    [scrollView addConstraints:[
        NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[imageView]-(0)-|"
                                options:0
                                metrics:nil
                                views:@{@"imageView":imageView}]];
    [scrollView addConstraints:[
                                NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[imageView]-(0)-|"
                                options:0
                                metrics:nil
                                views:@{@"imageView":imageView}]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

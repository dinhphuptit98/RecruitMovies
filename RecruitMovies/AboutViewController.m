//
//  AboutViewController.m
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webAboutView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuItem;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.revealViewController.delegate = self;
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    self.menuItem.target = self.revealViewController;
    self.menuItem.action = @selector(revealToggle:);
    self.webAboutView.delegate = self;
    NSString *stringURL = @"https://www.themoviedb.org/about";
    NSURL *url = [NSURL URLWithString:stringURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webAboutView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.spinner startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.spinner stopAnimating];
    self.spinner.hidesWhenStopped = true;
}
@end

//
//  SlideMenuViewController.m
//  RecruitMovies
//
//  Created by Admin on 8/3/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "SlideMenuViewController.h"
#import "EditProfileViewController.h"
@interface SlideMenuViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SlideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)edit:(UIButton *)sender {
    EditProfileViewController *showMovieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"EditProfileViewController"];
    [[self navigationController] pushViewController:showMovieVC animated:YES];
}
- (IBAction)showAll:(UIButton *)sender {
}

@end

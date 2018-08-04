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
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.nameUser.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"nameUser"];
    self.emailUser.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"emailUser"];
    self.sexUser.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"sexUser"];
    self.dateUser.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"dateUser"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"photoUser"]){
        NSData *loadData = [defaults objectForKey:@"photoUser"];
        self.photoUser.image = [UIImage imageWithData:loadData];
    }
}
- (IBAction)showAll:(UIButton *)sender {
}

@end

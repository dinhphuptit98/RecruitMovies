//
//  SlideMenuViewController.m
//  RecruitMovies
//
//  Created by Admin on 8/3/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "SlideMenuViewController.h"
#import "EditProfileViewController.h"
#import <CoreData/CoreData.h>
#import "CoreDataHelper.h"
#import "MoviesListViewController.h"
@interface SlideMenuViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *moviesRemider;
@end

@implementation SlideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];
    
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
    self.moviesRemider = [[NSMutableArray alloc]init];
    self.moviesRemider = [CoreDataHelper.shared getRemiderMovies];
    NSLog(@"%@",self.moviesRemider);
}

//Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.moviesRemider.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.moviesRemider[indexPath.row] nameMovieRemider];
    return cell;
}
- (IBAction)showAll:(UIButton *)sender {
}

@end

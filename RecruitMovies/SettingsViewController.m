//
//  SettingsViewController.m
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "SettingsViewController.h"
#import "YearCell.h"
#import "RatingMovieCell.h"
#import "FilterMovieCell.h"
@interface SettingsViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *arrFilterMovie;
@property (nonatomic,strong) NSArray *arrSorted;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuItem;
@end

@implementation SettingsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.revealViewController.delegate = self;
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    self.menuItem.target = self.revealViewController;
    self.menuItem.action = @selector(revealToggle:);
    [self.tableView registerNib:[UINib nibWithNibName:@"FilterMovieCell" bundle:nil] forCellReuseIdentifier:@"Cell1"];
    [self.tableView registerNib:[UINib nibWithNibName:@"RatingMovieCell" bundle:nil] forCellReuseIdentifier:@"Cell2"];
    [self.tableView registerNib:[UINib nibWithNibName:@"YearCell" bundle:nil] forCellReuseIdentifier:@"Cell3"];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UITableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberSetion = 0;
    if (section == 0){
        numberSetion = 6;
    }
    if  (section == 1){
        numberSetion = 2;
    }
    return numberSetion;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger height;
    if (indexPath.row == 4){
        height = 100;
    }else{
        height = 50;
    }
    return height;
}
//hien thi cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.row == 4){
        RatingMovieCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"Cell2" forIndexPath:indexPath];
        cell = cell2;
    }else if(indexPath.row == 5){
        YearCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"Cell3" forIndexPath:indexPath];
        cell = cell3;
    }else{
        FilterMovieCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
        cell = cell1;
    }
    
    return cell;
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}

@end

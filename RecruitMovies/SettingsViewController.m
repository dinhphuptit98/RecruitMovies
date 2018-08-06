//
//  SettingsViewController.m
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "SettingsViewController.h"
#import "RatingAndDateCell.h"
#import "FilterCell.h"
@interface SettingsViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *arrFilterMovie;
@property (nonatomic,strong) NSArray *arrSorted;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuItem;
@property (strong, nonatomic) IBOutlet UIView *viewHeader;
@end
@implementation SettingsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.revealViewController.delegate = self;
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    self.menuItem.target = self.revealViewController;
    self.menuItem.action = @selector(revealToggle:);
    [self.tableView registerNib:[UINib nibWithNibName:@"FilterCell" bundle:nil] forCellReuseIdentifier:@"FilterCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"RatingAndDateCell" bundle:nil] forCellReuseIdentifier:@"RatingAndDateCell"];
    

    self.arrFilterMovie = @[@"Popular Movie",@"Top Rate Movie",@"Upcoming Movies",@"Now Playing Movies"];
    self.arrSorted = @[@"Release date",@"Rating"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UITableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberSetion = 0;

    switch (section) {
        case 0:
            numberSetion = 4;
            break;
        case 1:
            numberSetion = 0;
            break;
        case 2:
            numberSetion = 2;
            break;
        case 3:
            numberSetion = 1;
            break;
        default:
            break;
    }
    return numberSetion;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1){
        return   200;
    }
    return 44;
}
//hien thi cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FilterCell *filterCell = [tableView dequeueReusableCellWithIdentifier:@"FilterCell" forIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:
            filterCell.nameMovieFilter.text = self.arrFilterMovie[indexPath.row];
            break;
        case 2:
            filterCell.nameMovieFilter.text = self.arrSorted[indexPath.row];
        case 3:
            filterCell.nameMovieFilter.text = @"Number Of Page perLoading";
        default:
            break;
    }
    

    return filterCell;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerTableView = [[UIView alloc] init];
    
    if (section == 1) {
        headerTableView = self.viewHeader;
    }
    headerTableView.backgroundColor = [UIColor greenColor];
    return headerTableView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return  150;
    }
    return 44;
}

- ( NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    NSString *title = @"";
    switch (section) {
        case 0:
            title = @"Filter";
            break;
        case 2:
            title = @"Sort By";
            break;
        case 3:
            title = @"Number Of Loading";
            break;
        default:
            break;
    }
    return title;
}
@end

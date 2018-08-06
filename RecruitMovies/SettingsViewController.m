//
//  SettingsViewController.m
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "SettingsViewController.h"
#import "FilterCell.h"
@interface SettingsViewController () <UITableViewDelegate,UITableViewDataSource,FilterCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *arrFilterMovie;
@property (nonatomic,strong) NSArray *arrSorted;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuItem;
@property (strong, nonatomic) IBOutlet UIView *viewHeader;
@property (nonatomic,strong) NSString *numberPage;
@property (nonatomic,assign) BOOL checked;
@property (nonatomic,assign) NSIndexPath *indexPathChecked;
@end
@implementation SettingsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.revealViewController.delegate = self;
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    self.menuItem.target = self.revealViewController;
    self.menuItem.action = @selector(revealToggle:);
    [self.tableView registerNib:[UINib nibWithNibName:@"FilterCell" bundle:nil] forCellReuseIdentifier:@"FilterCell"];
    

    self.arrFilterMovie = @[@"Popular Movie",@"Top Rate Movie",@"Upcoming Movies",@"Now Playing Movies"];
    self.arrSorted = @[@"Release date",@"Rating"];
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
        return   100;
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
            break;
        case 3:
            filterCell.nameMovieFilter.text = @"Number Of Page perLoading";
            filterCell.checkedMovie.hidden = true;
            filterCell.numberPage.hidden = false;
            break;
        default:
            break;
    }
    
    filterCell.delegate = self;
    return filterCell;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tableHeader;
    if (section == 1) {
        tableHeader = self.viewHeader;
    }
    return tableHeader;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    int height;
    if (section == 1) {
        height = 100;
    }else{
        height = 30;
    }
    return height;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title;
    switch (section) {
        case 0:
            title = @"Filter Movies";
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

- (void)didSelectedRatingAt:(NSIndexPath *)indexPath with:(bool)isLike andWith:(NSString *)numberOfPage{
    self.numberPage = numberOfPage;
    self.indexPathChecked = indexPath;
    self.checked = isLike;
    
}



@end

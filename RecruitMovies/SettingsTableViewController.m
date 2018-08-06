//
//  SettingsTableViewController.m
//  RecruitMovies
//
//  Created by Admin on 8/6/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "Constant.h"
#import "SearchMovieTableViewController.h"
@interface SettingsTableViewController () <SWRevealViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UISlider *slideRate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuItem;
@property (weak, nonatomic) IBOutlet UILabel *rateLabel;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *checkedButton;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *sortedButton;
@property (weak, nonatomic) IBOutlet UITextField *yearText;
@property (weak, nonatomic) IBOutlet UITextField *numberPageText;
@property (nonatomic,strong) NSString *urlMovie;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,assign) float valueRating;
@property (assign, nonatomic) bool checkSorted;
@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.urlMovie = MoviePopular;
    self.revealViewController.delegate = self;
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    self.menuItem.target = self.revealViewController;
    self.menuItem.action = @selector(revealToggle:);
}

- (IBAction)checkedMovie:(UIButton *)sender {
    for (UIButton *i in self.checkedButton){
        if (i == sender){
            i.selected = true;
            switch (i.tag) {
                case 0:
                    self.urlMovie = MoviePopular;
                    break;
                case 1:
                    self.urlMovie = MovieTopRates;
                    break;
                case 2:
                    self.urlMovie = MovieUpComing;
                    break;
                case 3:
                    self.urlMovie = MovieNowPlaying;
                    break;
                default:
                    break;
            }
        }else{
            i.selected = false;
        }
    }
    
}
- (IBAction)sortedCheckedButton:(UIButton *)sender {
    for (UIButton *i in self.sortedButton){
        if (i == sender){
            i.selected = true;
            switch (sender.tag) {
                case 5:
                    self.checkSorted = true;
                    break;
                case 6:
                     self.checkSorted = false;
                    break;
                default:
                    break;
            }
        }else{
            i.selected = false;
        }
    }
}
- (IBAction)searchingMovies:(UIBarButtonItem *)sender {
    self.url = [NSString stringWithFormat:@"%@%@",self.urlMovie,self.numberPageText.text];
    SearchMovieTableViewController *showSearchMovieVC;
    showSearchMovieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchMovieTableViewController"];
    showSearchMovieVC.urlDetail = self.url;
    showSearchMovieVC.dateCheck = self.yearText.text;
    showSearchMovieVC.ratingCheck = self.valueRating;
    showSearchMovieVC.checkedSorted = self.checkSorted;
    [[self navigationController] pushViewController:showSearchMovieVC animated:YES];
}
- (IBAction)slideChangeValue:(UISlider *)sender {
    UISlider *slider = (UISlider*)sender;
    NSString *newValue;
    self.valueRating = slider.value;

    newValue = [NSString stringWithFormat:@"%.1f",self.valueRating];
    self.rateLabel.text = newValue;
}
@end

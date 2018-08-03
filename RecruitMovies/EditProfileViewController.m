//
//  EditProfileViewController.m
//  RecruitMovies
//
//  Created by Admin on 8/3/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoUser;

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)tapLibrary:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.photoUser setImage:info[UIImagePickerControllerOriginalImage]];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)cancel:(UIButton *)sender {
    
}

- (IBAction)save:(UIButton *)sender {
}

- (IBAction)pickerDate:(UIButton *)sender {
}
- (IBAction)swithSex:(UISwitch *)sender {
}
@end

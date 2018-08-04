//
//  EditProfileViewController.m
//  RecruitMovies
//
//  Created by Admin on 8/3/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "EditProfileViewController.h"
#import "SlideMenuViewController.h"
@interface EditProfileViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoUser;
@property (weak, nonatomic) IBOutlet UITextField *nameUser;
@property (weak, nonatomic) IBOutlet UILabel *dateUser;
@property (weak, nonatomic) IBOutlet UITextField *emailUser;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switchBt;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *cancelPicker;
@property (weak, nonatomic) IBOutlet UIButton *savePicker;

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)cancel:(UIBarButtonItem *)sender {
    [[self navigationController] dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)save:(UIBarButtonItem *)sender {
    [[self navigationController] dismissViewControllerAnimated:true completion:nil];
    [[NSUserDefaults standardUserDefaults] setObject:self.nameUser.text forKey:@"nameUser"];
    [[NSUserDefaults standardUserDefaults] setObject:self.emailUser.text forKey:@"emailUser"];
    [[NSUserDefaults standardUserDefaults] setObject:self.sexLabel.text forKey:@"sexUser"];
    [[NSUserDefaults standardUserDefaults] setObject:self.dateUser.text forKey:@"dateUser"];
    
}
// pick Image
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
    NSData *imageData = UIImageJPEGRepresentation(self.photoUser.image, 1);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:imageData forKey:@"photoUser"];
    [defaults synchronize];
    [picker dismissViewControllerAnimated:YES completion:nil];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


- (IBAction)swithSex:(UISwitch *)sender {
    if (sender.isOn){
        self.sexLabel.text = @"Male";
    }else{
        self.sexLabel.text = @"Female";
    }
}
- (IBAction)pickerDate:(UIButton *)sender {
    self.datePicker.hidden = false;
    self.cancelPicker.hidden = false;
    self.savePicker.hidden = false;
}
- (IBAction)cancelPicker:(UIButton *)sender {
    self.datePicker.hidden = true;
    self.cancelPicker.hidden = true;
    self.savePicker.hidden = true;
}
- (IBAction)saveButton:(UIButton *)sender {
    self.datePicker.hidden = true;
    self.cancelPicker.hidden = true;
    self.savePicker.hidden = true;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MMMM d"];
    self.dateUser.text = [dateFormatter stringFromDate:self.datePicker.date];
    NSLog(@"%@",self.dateUser);
}




@end

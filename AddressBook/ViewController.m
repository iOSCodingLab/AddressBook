//
//  ViewController.m
//  AddressBook
//
//  Created by Ricardo Reyes on 6/14/14.
//  Copyright (c) 2014 Ricardo Reyes. All rights reserved.
//

#import "ViewController.h"

@import AddressBook;
@import AddressBookUI;

@interface ViewController ()<ABPeoplePickerNavigationControllerDelegate>
            
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openAddressBook:(UIButton *)sender
{
    ABPeoplePickerNavigationController *peoplePickerNC = [ABPeoplePickerNavigationController new];
    peoplePickerNC.peoplePickerDelegate = self;
    [self presentViewController:peoplePickerNC animated:YES completion:^
    {
        
    }];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    NSString *name = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty));
    
    self.nameLabel.text = [NSString stringWithFormat:@"Name: %@", name];
    
    [peoplePicker dismissViewControllerAnimated:YES completion:^
    {
        
    }];
    
    return NO;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [peoplePicker dismissViewControllerAnimated:YES completion:^
     {
         
     }];
}

@end

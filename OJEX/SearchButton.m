//
//  SearchButton.m
//  OJEX
//
//  Created by alham fikri on 1/28/13.
//  Copyright (c) 2013 Badr Interactive. All rights reserved.
//

#import "SearchButton.h"
#import "LoginController.h"
#import "User.h"
#import "GlobalVar.h"
#import <QuartzCore/QuartzCore.h>

@implementation SearchButton

@synthesize wrapper;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)searchPressed:(id)sender {
    NSString *actionSheetTitle = @"Menu"; //Action Sheet Title
    NSString *other1 = @"My Profile";
    NSString *other2 = @"Setting";
    NSString *other3 = @"Logout";
    NSString *cancelTitle = @"Cancel";
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:other1, other2, other3, nil];
    [actionSheet showInView:self];
    

}

- (IBAction)postARide:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone"
                                                         bundle: nil];
    
    //opening my profile
    UINavigationController *myNewVC =  [storyboard instantiateViewControllerWithIdentifier:@"PostARideNavigation"];

    
    [wrapper presentViewController:myNewVC animated:YES completion:NULL];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone"
                                                         bundle: nil];
    
    //Get the name of the current pressed button
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if  ([buttonTitle isEqualToString:@"Destructive Button"])
    {
    }
    if ([buttonTitle isEqualToString:@"My Profile"])
    {
        //opening my profile
        UINavigationController *myNewVC =  [storyboard instantiateViewControllerWithIdentifier:@"ProfileNavigation"];
       
        GlobalVar* g = [GlobalVar getInstance];
        g.userProfile = g.user;
        
        [wrapper presentViewController:myNewVC animated:YES completion:NULL];
        //[wrapper presentModalViewController:myNewVC animated:YES];
    }
    if ([buttonTitle isEqualToString:@"Setting"])
    {
        UINavigationController *myNewVC =  [storyboard instantiateViewControllerWithIdentifier:@"SettingNavigation"];
        [wrapper presentViewController:myNewVC animated:YES completion:NULL];
    }
    if ([buttonTitle isEqualToString:@"Logout"])
    {
        //opening Login Screen
        UINavigationController *myNewVC =  [storyboard instantiateViewControllerWithIdentifier:@"LoginScreen"];
        [wrapper presentViewController:myNewVC animated:YES completion:NULL];
    }
    if ([buttonTitle isEqualToString:@"Cancel Button"])
    {
        NSLog(@"Cancel pressed -> Cancel ActionSheet");
    }

}


@end

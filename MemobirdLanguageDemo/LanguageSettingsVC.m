//
//  LanguageSettingsVC.m
//  MemobirdLanguageDemo
//
//  Created by Kumaravel  Gurusamy on 11/01/2018.
//  Copyright © 2018 Intretech Inc. All rights reserved.
//

#import "LanguageSettingsVC.h"
#import "MCLocalization.h"

@interface LanguageSettingsVC ()

@end

@implementation LanguageSettingsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localize) name:MCLocalizationLanguageDidChangeNotification object:nil];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"selectedLanguage"]!=nil){
        [MCLocalization sharedInstance].language = [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedLanguage"];
    }
    [super viewWillAppear:YES];
}

- (void)localize
{
    _titleLabel.text = [MCLocalization stringForKey:@"Choose Language"];
    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:[MCLocalization stringForKey:@"tabMenu1"]];
    [[self.tabBarController.tabBar.items objectAtIndex:1] setTitle:[MCLocalization stringForKey:@"tabMenu2"]];
    [[self.tabBarController.tabBar.items objectAtIndex:2] setTitle:[MCLocalization stringForKey:@"tabMenu3"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchToRussian:(id)sender
{
    [MCLocalization sharedInstance].language = @"ru";
    [[NSUserDefaults standardUserDefaults] setObject:[MCLocalization sharedInstance].language forKey:@"selectedLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)switchToEnglish:(id)sender
{
    [MCLocalization sharedInstance].language = @"en";
    [[NSUserDefaults standardUserDefaults] setObject:[MCLocalization sharedInstance].language forKey:@"selectedLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)switchToChinese:(id)sender
{
    [MCLocalization sharedInstance].language = @"cn";
    [[NSUserDefaults standardUserDefaults] setObject:[MCLocalization sharedInstance].language forKey:@"selectedLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

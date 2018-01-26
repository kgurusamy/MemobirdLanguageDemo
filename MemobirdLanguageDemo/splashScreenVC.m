//
//  splashScreenVC.m
//  MemobirdLanguageDemo
//
//  Created by Kumaravel  Gurusamy on 11/01/2018.
//  Copyright © 2018 Intretech Inc. All rights reserved.
//

#import "splashScreenVC.h"
#import "AppDelegate.h"
#import "FirstViewController.h"
#import "MCLocalization.h"

@interface splashScreenVC ()

@end

@implementation splashScreenVC

- (void)viewDidLoad {
    [super viewDidLoad];

    if([[NSUserDefaults standardUserDefaults] objectForKey:@"selectedLanguage"]!=nil){
        NSString *selectedLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedLanguage"];
        _splashImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"Splash_screen_%@.jpg",selectedLanguage]];
        [MCLocalization sharedInstance].language = [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedLanguage"];
    }
    //self.tabBarController.tabBar.hidden = YES;
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
   
}
-(void)viewDidAppear:(BOOL)animated
{
    
    //[self dismissViewControllerAnimated:NO completion:nil];
//    NSString * storyboardIdentifier = @"Main";
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardIdentifier bundle: nil];
//    FirstViewController * firstVC = [storyboard instantiateViewControllerWithIdentifier:@"firstVC"];
//    //splashScreenVC *splashViewController = [splashScreenVC new];
//    [self presentViewController:firstVC animated:NO completion:nil];
    
    [super viewDidAppear:YES];
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"selectedLanguage"]!=nil){
        [MCLocalization sharedInstance].language = [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedLanguage"];
    }

    [NSThread sleepForTimeInterval:2.0];
    
    NSLog(@"Selected language : %@",[MCLocalization sharedInstance].language);
    
    self.tabBarController.tabBar.hidden = NO;

    NSMutableArray *tbViewControllers = [NSMutableArray arrayWithArray:[self.tabBarController viewControllers]];
    [tbViewControllers removeObjectAtIndex:0];
    [self.tabBarController setViewControllers:tbViewControllers];
    [self.tabBarController setSelectedIndex:0];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

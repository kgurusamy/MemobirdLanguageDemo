//
//  SecondViewController.m
//  MemobirdLanguageDemo
//
//  Created by Kumaravel  Gurusamy on 11/01/2018.
//  Copyright © 2018 Intretech Inc. All rights reserved.
//

#import "SecondViewController.h"
#import "MCClasses/MCLocalization.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localize) name:MCLocalizationLanguageDidChangeNotification object:nil];
    // Do any additional setup after loading the view, typically from a nib.
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
    _titleLabel.text = [MCLocalization stringForKey:@"title"];
    _descriptionLabel.text = [MCLocalization stringForKey:@"description"];
    _placeHolderLabel.text = [NSString stringWithFormat:@"%@,%@", [MCLocalization stringForKey:@"placeholder1" withPlaceholders:@{@"%name%":@"Intretech"}],[MCLocalization stringForKey:@"placeholder2" withPlaceholders:@{@"{{project}}":[MCLocalization stringForKey:@"project"]}]];
    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:[MCLocalization stringForKey:@"tabMenu1"]];
    [[self.tabBarController.tabBar.items objectAtIndex:1] setTitle:[MCLocalization stringForKey:@"tabMenu2"]];
    [[self.tabBarController.tabBar.items objectAtIndex:2] setTitle:[MCLocalization stringForKey:@"tabMenu3"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  AppDelegate.m
//  MemobirdLanguageDemo
//
//  Created by Kumaravel  Gurusamy on 11/01/2018.
//  Copyright © 2018 Intretech Inc. All rights reserved.
//

#import "AppDelegate.h"


#import "MCClasses/MCLocalization.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self applyLanguageSettings];
    
    return YES;
}

-(void)applyLanguageSettings
{
    NSString *languageWithRegion = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSString * localLanguage = [[languageWithRegion componentsSeparatedByString:@"-"]
                                objectAtIndex:0];
    NSLog(@"Local Language : %@", localLanguage);
    
    // Using a file per one individual language:
    NSDictionary * languageURLPairs = @{
                                        @"en":[[NSBundle mainBundle] URLForResource:@"en.json" withExtension:nil],
                                        @"cn":[[NSBundle mainBundle] URLForResource:@"cn.json" withExtension:nil],
                                        @"ru":[[NSBundle mainBundle] URLForResource:@"ru.json" withExtension:nil]
                                        };
    
    NSString *selectedLanguage = @"";
    // Check NSUserdafaults to for already stored selectedLanguage is available
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"selectedLanguage"]==nil){
        
        if([localLanguage isEqualToString:@"en"]){
            [MCLocalization loadFromLanguageURLPairs:languageURLPairs defaultLanguage:@"en"];
            selectedLanguage = @"en";
        }else if([localLanguage isEqualToString:@"cn"]){
            [MCLocalization loadFromLanguageURLPairs:languageURLPairs defaultLanguage:@"cn"];
            selectedLanguage = @"cn";
        }else if([localLanguage isEqualToString:@"ru"]){
            [MCLocalization loadFromLanguageURLPairs:languageURLPairs defaultLanguage:@"ru"];
            selectedLanguage = @"ru";
        }else{
            [MCLocalization loadFromLanguageURLPairs:languageURLPairs defaultLanguage:@"en"];
            selectedLanguage = @"en";
        }
        [[NSUserDefaults standardUserDefaults] setObject:selectedLanguage forKey:@"selectedLanguage"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else{
        selectedLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedLanguage"];
        [MCLocalization loadFromLanguageURLPairs:languageURLPairs defaultLanguage:selectedLanguage];
    }
    
    [MCLocalization sharedInstance].noKeyPlaceholder = @"[No '{key}' in '{language}']";
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

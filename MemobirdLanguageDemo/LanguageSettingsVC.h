//
//  LanguageSettingsVC.h
//  MemobirdLanguageDemo
//
//  Created by Kumaravel  Gurusamy on 11/01/2018.
//  Copyright © 2018 Intretech Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanguageSettingsVC : UIViewController
{
    __weak IBOutlet UILabel *_titleLabel;
}

- (IBAction)switchToRussian:(id)sender;
- (IBAction)switchToEnglish:(id)sender;

@end

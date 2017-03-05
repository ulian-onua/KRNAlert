//
//  ViewController.m
//  KRNAlertExample
//
//  Created by ulian_onua on 3/5/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

#import "ViewController.h"
#import "KRNAlert.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Actions
- (IBAction)alertOkPressed:(id)sender {
    [KRNAlert alertOKFrom:self withTitle:@"ALERT OK" message:@"Everything is OK" completion:^{
       NSLog(@"OK Button pressed");
    }];
}

- (IBAction)alertOkCancelPressed:(id)sender {
    [KRNAlert alertOKCancelFrom:self withTitle:@"ALERT OK Cancel" message:@"Everything is OK" completion:^{
        NSLog(@"OK Button pressed");
    }];
}
- (IBAction)alertYesNoPressed:(id)sender {
    [KRNAlert alertYesNoFrom:self withTitle:@"ALERT YES NO" message:@"Everything is OK" yesCompletion:^{
        NSLog(@"Yes Button pressed");
    } noCompletion:^{
        NSLog(@"No Button pressed");
    }];
}
- (IBAction)alertErrorPressed:(id)sender {
    [KRNAlert alertErrorFrom:self withMessage:@"Some error happened" completion:^{
        NSLog(@"Error happened");
    }];
}

- (IBAction)customAlertPressed:(id)sender {
    [KRNAlert alertFrom:self withTitle:@"Some title" message:@"Some message" firstButtonTitle:@"First Button" firstButtonCompletion:nil secondButtonTitle:@"Second button" secondButtonCompletion:nil];
}
- (IBAction)alertWithTextField:(id)sender {
    [KRNAlert alertOKCancelFrom:self withTitle:@"Custom with textfield" message:@"Custom message" textFieldPlaceholder:@"Password" textFieldText:nil secureEntry:YES completion:^(NSString *textFieldString) {
        NSLog(@"Password is %@", textFieldString);
    }];
}

#pragma mark - Actions Sheets
- (IBAction)photoActionSheetPressed:(id)sender {
    [KRNAlert actionSheetFrom:self pickPhotofromGallery:^{
        NSLog(@"Gallery pressed");
    } andCamera:^{
        NSLog(@"Camera pressed");
    }];
}
- (IBAction)customActionSheet:(id)sender {
    [KRNAlert actionSheetFrom:self withTitle:@"Some action sheet" message:@"Some message" firstButtonTitle:@"First button title" firstButtonCompletion:nil secondButtonTitle:@"Second button title" secondButtonCompletion:nil];
}
- (IBAction)fiveButtonsActionSheet:(id)sender {
    NSMutableArray<UIAlertAction *> *actions = [NSMutableArray new];
    NSArray<NSString *> *names = @[@"One", @"Two", @"Three", @"Four", @"Five"];
    for (NSString *name in names) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:name style:UIAlertActionStyleDefault handler:nil];
        [actions addObject:action];
    }
    [KRNAlert actionSheetFrom:self withTitle:@"Five buttons action" message:@"Here is five buttons" andActions:[actions copy]];
}

@end

//
//  UIViewController+KRNAlert.h
//  KRNAlertExample
//
//  Created by ulian_onua on 3/7/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KRNAlert)

- (void)alertOKWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(void))completion;

//alert view with custom title, message and two buttons with name "OK" and "Cancel". Completion block is called if "OK" button pressed

- (void)alertOKCancelWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(void))completion;

//alert view with custom title, message and two buttons with name "YES" and "NO".
- (void)alertYesNoWithTitle:(NSString *)title message:(NSString *)message yesCompletion:(void(^)(void))yesCompletion noCompletion:(void(^)(void))noCompletion;

//alert with title "ERROR", custom message and "OK" Button
- (void)alertErrorWithMessage:(NSString *)message completion:(void(^)(void))completion;

//alert view with custom title, message and one or two buttons. If second button is nil than only one button will exist.
- (void)alertWithTitle:(NSString *)title message:(NSString *)message firstButtonTitle:(NSString *)firstButtonTitle firstButtonCompletion:(void(^)(void))firstButtonCompletion secondButtonTitle:(NSString *)secondButtonTitle secondButtonCompletion:(void(^)(void))secondButtonCompletion;

//as many buttons as you wish with array of actions
- (void)alertWithTitle:(NSString *)title message:(NSString *)message andActions:(NSArray<UIAlertAction *> *)actions;

#pragma mark - AlertWithTextField

- (void)alertOKCancelWithTitle:(NSString *)title message:(NSString *)message textFieldPlaceholder:(NSString *)textFieldPlaceholder textFieldText:(NSString *)textFieldText secureEntry:(BOOL)secureEntry completion:(void(^)(NSString *textFieldString))completion;

#pragma mark - Helpers

- (void)actionSheetFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message firstButtonTitle:(NSString *)firstButtonTitle firstButtonCompletion:(void(^)(void))firstButtonCompletion secondButtonTitle:(NSString *)secondButtonTitle secondButtonCompletion:(void(^)(void))secondButtonCompletion;

- (void)actionSheetFrom:(UIViewController *)viewController pickPhotofromGallery:(void(^)(void))galleryCompletion andCamera:(void(^)(void))cameraCompletion;

- (void)actionSheetFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message andActions:(NSArray<UIAlertAction *> *)actions;

@end

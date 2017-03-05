//
//  KRNAlert.h
//  KRNAlertExample
//
//  Created by ulian_onua on 3/5/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;


@interface KRNAlert : NSObject

#pragma mark - Alert Views
//alert view with custom title, message and one button with name "OK".

+ (void)alertOKFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message completion:(void(^)(void))completion;

//alert view with custom title, message and two buttons with name "OK" and "Cancel". Completion block is called if "OK" button pressed

+ (void)alertOKCancelFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message completion:(void(^)(void))completion;

//alert view with custom title, message and two buttons with name "YES" and "NO". 
+ (void)alertYesNoFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message yesCompletion:(void(^)(void))yesCompletion noCompletion:(void(^)(void))noCompletion;

//alert with title "ERROR", custom message and "OK" Button
+ (void)alertErrorFrom:(UIViewController *)viewController withMessage:(NSString *)message completion:(void(^)(void))completion;

//alert view with custom title, message and one or two buttons. If second button is nil than only one button will exist.
+ (void)alertFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message firstButtonTitle:(NSString *)firstButtonTitle firstButtonCompletion:(void(^)(void))firstButtonCompletion secondButtonTitle:(NSString *)secondButtonTitle secondButtonCompletion:(void(^)(void))secondButtonCompletion;

//as many buttons as you wish with array of actions
+ (void)alertFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message andActions:(NSArray<UIAlertAction *> *)actions;

#pragma mark - AlertWithTextField

+ (void)alertOKCancelFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message textFieldPlaceholder:(NSString *)textFieldPlaceholder textFieldText:(NSString *)textFieldText secureEntry:(BOOL)secureEntry completion:(void(^)(NSString *textFieldString))completion;

#pragma mark - Action Sheets

//custom Actions Sheet with two buttons
+ (void)actionSheetFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message firstButtonTitle:(NSString *)firstButtonTitle firstButtonCompletion:(void(^)(void))firstButtonCompletion secondButtonTitle:(NSString *)secondButtonTitle secondButtonCompletion:(void(^)(void))secondButtonCompletion;

//actions sheet for image picker
+ (void)actionSheetFrom:(UIViewController *)viewController pickPhotofromGallery:(void(^)(void))galleryCompletion andCamera:(void(^)(void))cameraCompletion;

//as many buttons as you wish with array of actions
+ (void)actionSheetFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message andActions:(NSArray<UIAlertAction *> *)actions;

#pragma mark - Helpers

+ (void)setOKButtonTitle:(NSString *)okButtonTitle;
+ (void)setCancelButtonTitle:(NSString *)cancelButtonTitle;
+ (void)setYes:(NSString *)yesButtonTitle andNoButtonTitles:(NSString *)noButtonTitle;
+ (void)setErrorTitle:(NSString *)errorTitle;
+ (void)setPhotoActionSheetTitle:(NSString *)title andMessage:(NSString *)message;
+ (void)setPhotoActionSheetGalleryButtonTitle:(NSString *)galleryButtonTitle andCameraButtonTitle:(NSString *)cameraButtonTitle;

@end

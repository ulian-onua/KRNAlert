//
//  UIViewController+KRNAlert.m
//  KRNAlertExample
//
//  Created by ulian_onua on 3/7/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

#import "UIViewController+KRNAlert.h"
#import "KRNAlert.h"

@implementation UIViewController (KRNAlert)

- (void)alertOKWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(void))completion {
    [KRNAlert alertOKFrom:self withTitle:title message:message completion:completion];
}

- (void)alertOKCancelWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(void))completion {
    [KRNAlert alertOKCancelFrom:self withTitle:title message:message completion:completion];
}

- (void)alertYesNoWithTitle:(NSString *)title message:(NSString *)message yesCompletion:(void(^)(void))yesCompletion noCompletion:(void(^)(void))noCompletion {
    [KRNAlert alertYesNoFrom:self withTitle:title message:message yesCompletion:yesCompletion noCompletion:noCompletion];
}

- (void)alertErrorWithMessage:(NSString *)message completion:(void(^)(void))completion {
    [KRNAlert alertErrorFrom:self withMessage:message completion:completion];
}

- (void)alertWithTitle:(NSString *)title message:(NSString *)message firstButtonTitle:(NSString *)firstButtonTitle firstButtonCompletion:(void(^)(void))firstButtonCompletion secondButtonTitle:(NSString *)secondButtonTitle secondButtonCompletion:(void(^)(void))secondButtonCompletion {
    [KRNAlert alertFrom:self withTitle:title message:message firstButtonTitle:firstButtonTitle firstButtonCompletion:firstButtonCompletion secondButtonTitle:secondButtonTitle secondButtonCompletion:secondButtonCompletion];
}

- (void)alertWithTitle:(NSString *)title message:(NSString *)message andActions:(NSArray<UIAlertAction *> *)actions {
    [KRNAlert alertFrom:self withTitle:title message:message andActions:actions];
}

#pragma mark - Alert Titles

- (void)alertOKCancelWithTitle:(NSString *)title message:(NSString *)message textFieldPlaceholder:(NSString *)textFieldPlaceholder textFieldText:(NSString *)textFieldText secureEntry:(BOOL)secureEntry completion:(void(^)(NSString *textFieldString))completion {
    [KRNAlert alertOKCancelFrom:self withTitle:title message:message textFieldPlaceholder:textFieldPlaceholder textFieldText:textFieldText secureEntry:secureEntry completion:completion];
}

#pragma mark - Action Sheet

- (void)actionSheetFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message firstButtonTitle:(NSString *)firstButtonTitle firstButtonCompletion:(void(^)(void))firstButtonCompletion secondButtonTitle:(NSString *)secondButtonTitle secondButtonCompletion:(void(^)(void))secondButtonCompletion {
    [KRNAlert actionSheetFrom:self withTitle:title message:message firstButtonTitle:firstButtonTitle firstButtonCompletion:firstButtonCompletion secondButtonTitle:secondButtonTitle secondButtonCompletion:secondButtonCompletion];
}

- (void)actionSheetFrom:(UIViewController *)viewController pickPhotofromGallery:(void(^)(void))galleryCompletion andCamera:(void(^)(void))cameraCompletion {
    [KRNAlert actionSheetFrom:self pickPhotofromGallery:galleryCompletion andCamera:cameraCompletion];
}

- (void)actionSheetFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message andActions:(NSArray<UIAlertAction *> *)actions {
    [KRNAlert actionSheetFrom:viewController withTitle:title message:message andActions:actions];
}

@end

//
//  KRNAlert.m
//  KRNAlertExample
//
//  Created by ulian_onua on 3/5/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

#import "KRNAlert.h"

static NSString *KRNAlertOkButtonTitle = @"OK";
static NSString *KRNAlertCancelButtonTitle = @"Cancel";
static NSString *KRNAlertYesButtonTitle = @"Yes";
static NSString *KRNAlertNoButtonTitle = @"No";
static NSString *KRNAlertErrorTitle = @"ERROR";
static NSString *KRNPickPhotoTitle = @"Pick Photo";
static NSString *KRNPickPhotoMessage = @"Choose source";
static NSString *KRNPickPhotoGalleryButtonTitle = @"From gallery";
static NSString *KRNPickPhotoCameraButtonTitle = @"From camera";


@implementation KRNAlert

+ (void)alertOKFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message completion:(void(^)(void))completion {
    [self alertFrom:viewController withTitle:title message:message firstButtonTitle:KRNAlertOkButtonTitle  firstButtonCompletion:completion secondButtonTitle:nil secondButtonCompletion:nil];
}

+ (void)alertOKCancelFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message completion:(void(^)(void))completion {
     [self alertFrom:viewController withTitle:title message:message firstButtonTitle:KRNAlertCancelButtonTitle firstButtonCompletion:nil secondButtonTitle:KRNAlertOkButtonTitle secondButtonCompletion:completion];
}

+ (void)alertYesNoFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message yesCompletion:(void(^)(void))yesCompletion noCompletion:(void(^)(void))noCompletion {
    [self alertFrom:viewController withTitle:title message:message firstButtonTitle:KRNAlertNoButtonTitle firstButtonCompletion:noCompletion secondButtonTitle:KRNAlertYesButtonTitle secondButtonCompletion:yesCompletion];
}

+ (void)alertErrorFrom:(UIViewController *)viewController withMessage:(NSString *)message completion:(void(^)(void))completion {
    [self alertOKFrom:viewController withTitle:KRNAlertErrorTitle message:message completion:completion];
}

+ (void)alertFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message firstButtonTitle:(NSString *)firstButtonTitle firstButtonCompletion:(void(^)(void))firstButtonCompletion secondButtonTitle:(NSString *)secondButtonTitle secondButtonCompletion:(void(^)(void))secondButtonCompletion {
    
    NSMutableArray<UIAlertAction *> *actions = [NSMutableArray new];
    [actions addObject:[UIAlertAction actionWithTitle:firstButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        if (firstButtonCompletion) firstButtonCompletion();
    }]];
    
    if (secondButtonTitle) {
        [actions addObject:[UIAlertAction actionWithTitle:secondButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if (secondButtonCompletion) secondButtonCompletion();
        }]];
    }
    
    [self alertFrom:viewController withTitle:title message:message andActions:[actions copy]];
}

+ (void)alertFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message andActions:(NSArray<UIAlertAction *> *)actions {
    [self abstractAlertFrom:viewController withTitle:title message:message style:UIAlertControllerStyleAlert andActions:actions];
}

#pragma mark - AlertWithTextField

+ (void)alertOKCancelFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message textFieldPlaceholder:(NSString *)textFieldPlaceholder textFieldText:(NSString *)textFieldText secureEntry:(BOOL)secureEntry completion:(void(^)(NSString *textFieldString))completion {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        __block UITextField *textFieldForBlock;
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.secureTextEntry = secureEntry;
            textField.placeholder = textFieldPlaceholder;
            textField.text = textFieldText ? : @"";
            textFieldForBlock = textField;
        }];
        
        UIAlertAction *firstButton = [UIAlertAction actionWithTitle:KRNAlertCancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        }];
        
        UIAlertAction *secondButton = [UIAlertAction actionWithTitle:KRNAlertOkButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if (completion) {
                completion(textFieldForBlock.text);
            }
        }];
        [alertController addAction:firstButton];
        [alertController addAction:secondButton];
        [viewController presentViewController:alertController animated:YES completion:nil];
    });
   
}


#pragma mark - Action Sheets -

+ (void)actionSheetFrom:(UIViewController *)viewController pickPhotofromGallery:(void(^)(void))galleryCompletion andCamera:(void(^)(void))cameraCompletion {
    [self actionSheetFrom:viewController withTitle:KRNPickPhotoTitle message:KRNPickPhotoMessage firstButtonTitle:KRNPickPhotoGalleryButtonTitle firstButtonCompletion:galleryCompletion secondButtonTitle:KRNPickPhotoCameraButtonTitle secondButtonCompletion:cameraCompletion];
}


+ (void)actionSheetFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message firstButtonTitle:(NSString *)firstButtonTitle firstButtonCompletion:(void(^)(void))firstButtonCompletion secondButtonTitle:(NSString *)secondButtonTitle secondButtonCompletion:(void(^)(void))secondButtonCompletion {
    
    
    NSMutableArray<UIAlertAction *> *actions = [NSMutableArray new];
    [actions addObject:[UIAlertAction actionWithTitle:firstButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (firstButtonCompletion) firstButtonCompletion();
    }]];
    
    if (secondButtonTitle) {
        [actions addObject:[UIAlertAction actionWithTitle:secondButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if (secondButtonCompletion) secondButtonCompletion();
        }]];
    }
    [actions addObject:[UIAlertAction actionWithTitle:KRNAlertCancelButtonTitle style:UIAlertActionStyleCancel handler:nil]];
    
    [self abstractAlertFrom:viewController withTitle:title message:message style:UIAlertControllerStyleActionSheet andActions:[actions copy]];
}

+ (void)actionSheetFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message andActions:(NSArray<UIAlertAction *> *)actions {
    [self abstractAlertFrom:viewController withTitle:title message:message style:UIAlertControllerStyleActionSheet andActions:actions];

}


#pragma mark - Abstract

+ (void)abstractAlertFrom:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle) style andActions:(NSArray<UIAlertAction *> *)actions {
    if (!viewController) return;
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertController = [self alertControllerWithTitle:title message:message style:style andActions:actions];
        [viewController presentViewController:alertController animated:YES completion:nil];
    });
}

+ (UIAlertController *)alertControllerWithTitle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle) style andActions:(NSArray<UIAlertAction *> *)actions {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title ? : @"" message:message ? : @"" preferredStyle:style];
    if (actions && actions.count > 0) {
        for (UIAlertAction *action in actions) {
            [alertController addAction:action];
        }
    }
    return alertController;
}

#pragma mark - Helpers

+ (void)setOKButtonTitle:(NSString *)okButtonTitle {
    KRNAlertOkButtonTitle = okButtonTitle;
}
+ (void)setCancelButtonTitle:(NSString *)cancelButtonTitle {
    KRNAlertCancelButtonTitle = cancelButtonTitle;
}
+ (void)setYes:(NSString *)yesButtonTitle andNoButtonTitles:(NSString *)noButton {
    KRNAlertYesButtonTitle = yesButtonTitle;
    KRNAlertOkButtonTitle = KRNAlertOkButtonTitle;
}
+ (void)setErrorTitle:(NSString *)errorTitle {
    KRNAlertErrorTitle = errorTitle;
}
+ (void)setPhotoActionSheetTitle:(NSString *)title andMessage:(NSString *)message {
    KRNPickPhotoTitle = title;
    KRNPickPhotoMessage = message;
}
+ (void)setPhotoActionSheetGalleryButtonTitle:(NSString *)galleryButtonTitle andCameraButtonTitle:(NSString *)cameraButtonTitle {
    KRNPickPhotoGalleryButtonTitle = galleryButtonTitle;
    KRNPickPhotoCameraButtonTitle =  cameraButtonTitle;
}

@end

KRNAlert
===============

KRNAlert is a wrapper of UIAlertController to simplify its usage in typical cases


## Installation
####CocoaPods

(Unfamiliar with [CocoaPods](http://cocoapods.org/) yet? It's a dependency management tool for iOS and Mac, check it out!)

Just add `pod 'KRNAlert'` to your Podfile and run `pod install` in Terminal from your project folder.

Write `#import "KRNAlert.h"` in files where you need to use KRNAlert. 


## How to use
All methods of KRNAlert are static so you can simply call any of method without necessity of allocation of KRNAlert class instance.
Every method requeries from you to pass an instance of UIViewController from which alert will be presented.
### Alert Views

To present alert views you can use one of convenient methods described below:

```objc
+ (void)alertOKFrom:withTitle:message:completion:; // alert with custom title, message and one button with name "OK".
+ (void)alertOKCancelFrom:withTitle:message:completion:; //alert view with custom title, message and two buttons with name "OK" and "Cancel". Completion block is called if "OK" button pressed
+ (void)alertYesNoFrom:withTitle:message:yesCompletion:noCompletion:; //alert view with custom title, message and two buttons with name "YES" and "NO". 
+ (void)alertErrorFrom:withMessage:completion:; //alert view with title "ERROR", custom message and "OK" Button
```
For example if some button was pressed in your View Controller instance the usage of KRNAlert may look like below:
```objc
- (IBAction)buttonPressed:(id)sender {
    [KRNAlert alertOKFrom:self withTitle:@"ALERT" message:@"Everything is OK" completion:^{
        NSLog(@"OK Button pressed"); // completion will be called if button "OK" is pressed.
    }];
}
```

To present alert with one or two buttons with any title, message and buttons titles you can use next method:
```objc
+ (void)alertFrom:withTitle:message:firstButtonTitle:firstButtonCompletion:secondButtonTitle:secondButtonCompletion:;
```
The example:
```objc
- (IBAction)customAlertPressed:(id)sender {
    [KRNAlert alertFrom:self withTitle:@"Some title" message:@"Some message" firstButtonTitle:@"First Button" firstButtonCompletion:nil secondButtonTitle:@"Second button" secondButtonCompletion:nil]; // in this example completions are nil but in real app you probably would pass blocks which handle tapping on first of second button.
}
```
To present alert with as many buttons as you wish use method which takes an array of UIAlertActions instances:
```objc
+ (void)alertFrom:withTitle:message:andActions:;
```
The example of alert with five buttons written below:
```objc
- (IBAction)fiveButtonsActionSheet:(id)sender {
    NSMutableArray<UIAlertAction *> *actions = [NSMutableArray new];
    NSArray<NSString *> *names = @[@"One", @"Two", @"Three", @"Four", @"Five"];
    for (NSString *name in names) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:name style:UIAlertActionStyleDefault handler:nil];
        [actions addObject:action];
    }
    [KRNAlert actionSheetFrom:self withTitle:@"Five buttons action" message:@"Here is five buttons" andActions:[actions copy]];
}
```
There is also the method to present alert with one UITextField instance and handle entered text:
```objc
+ (void)alertOKCancelFrom:withTitle:message:textFieldPlaceholder:textFieldText:secureEntry:completion:;
```
Example below can be useful for alert with textField for password from user:
```objc
- (IBAction)alertWithTextField:(id)sender {
    [KRNAlert alertOKCancelFrom:self withTitle:@"Custom alert with textfield" message:@"Custom message" textFieldPlaceholder:@"Password" textFieldText:nil secureEntry:YES completion:^(NSString *textFieldString) {
        NSLog(@"Password is %@", textFieldString);
    }];
}
```

### Actions sheets
Methods for presenting actions sheets are similar to methods for presenting alert views.

To present convenient method of action sheet for picking photo use next example:
```objc
- (IBAction)photoActionSheetPressed:(id)sender {
    [KRNAlert actionSheetFrom:self pickPhotofromGallery:^{
        NSLog(@"Gallery pressed"); // here move user to his photo gallery
    } andCamera:^{
        NSLog(@"Camera pressed"); // here check if camera is available and move user to UIImagePickerController or custom photo picker
    }];
}
```
To present action sheet with one or two buttons and required button "Cancel" with any title, message and buttons titles you can use next method:
```objc
+ (void)actionSheetFrom:withTitle:message:firstButtonTitle:firstButtonCompletion:secondButtonTitle:secondButtonCompletion:;
```

To present action sheet with as many buttons as you wish use method which takes an array of UIAlertActions instances:
```objc
+ (void)actionSheetFrom:withTitle:message:andActions:;
```

### Redefining default button titles
You can redefine default alert button titles by using next methods:

```objc
+ (void)setOKButtonTitle:;
+ (void)setCancelButtonTitle:;
+ (void)setYes:andNoButtonTitles:;
+ (void)setErrorTitle:;
+ (void)setPhotoActionSheetTitle:andMessage:;
+ (void)setPhotoActionSheetGalleryButtonTitle:andCameraButtonTitle:;
```

## Requirements

* iOS 8.0 and above
* XCode 8+
* Example project will run only on iOS 9 and higher.

## License

KRNAlert is released under the MIT license. See LICENSE for details.

## Contact

Any suggestion or question? Please create a Github issue or reach me out.

[LinkedIn](https://www.linkedin.com/in/julian-drapaylo)

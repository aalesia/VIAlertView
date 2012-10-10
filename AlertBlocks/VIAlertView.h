//
//  VIAlertView.h
//  AlertBlocks
//
//  Created by Anthony Alesia on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VIAlertView;

@protocol VIAlertViewDelegate <NSObject>

@optional - (void)alertView:(VIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;
@optional - (void)alertView:(VIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex;
@optional - (void)alertViewCancel:(VIAlertView *)alertView;

@end

@interface VIAlertView : UIAlertView <UIAlertViewDelegate>

- (id)initWithCompletion:(void (^)(VIAlertView *alertView, NSInteger buttonIndex))completion title:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

@end

//
//  VIAlertView.m
//  AlertBlocks
//
//  Created by Anthony Alesia on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VIAlertView.h"

@interface VIAlertView ()

typedef void (^Completion)(VIAlertView *alertView, NSInteger buttonIndex);

@property (nonatomic, strong) Completion completion;
@property (nonatomic, assign) id<VIAlertViewDelegate> videlegate;

@end

@implementation VIAlertView

@synthesize completion = _completion;
@synthesize videlegate = _videlegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCompletion:(void (^)(VIAlertView *, NSInteger))completion title:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    
    if (self) {
        _videlegate = delegate;
        _completion = [completion copy];
        
		id eachObject;
		va_list argumentList;
		if (otherButtonTitles) {
			[self addButtonWithTitle:otherButtonTitles];
			va_start(argumentList, otherButtonTitles);
			while ((eachObject = va_arg(argumentList, id))) {
				[self addButtonWithTitle:eachObject];
			}
			va_end(argumentList);
		}
    }
    
    return self;
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    _completion(self, buttonIndex);
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ([_videlegate respondsToSelector:@selector(alertView:didDismissWithButtonIndex:)]) {
        [_videlegate alertView:self didDismissWithButtonIndex:buttonIndex];
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ([_videlegate respondsToSelector:@selector(alertView:willDismissWithButtonIndex:)]) {
        [_videlegate alertView:self willDismissWithButtonIndex:buttonIndex];
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    if ([_videlegate respondsToSelector:@selector(alertViewCancel:)]) {
        [_videlegate alertViewCancel:self];
    }
}

@end

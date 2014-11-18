//
//  GOActionSheet.m
//  GOActionSheet https://github.com/goppinath/GOActionSheet
//
//  Created by Goppinath Thurairajah on 18.11.14.
//  Copyright (c) 2014 Goppinath Thurairajah. http://goppinath.com
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import "GOActionSheet.h"

#pragma mark - GOActionSheetButton class

@implementation GOActionSheetButton

- (instancetype)initWithTitle:(NSString *)title selectionHandler:(void (^)(GOActionSheetButton *actionSheetButton))selectionHandler {
    
    if (self = [super init]) {
        
        _title = title;
        _selectionHandler = selectionHandler;
    }
    return self;
}

+ (instancetype)actionSheetButtonWithTitle:(NSString *)title selectionHandler:(void (^)(GOActionSheetButton *actionSheetButton))selectionHandler {
    
    return [[self alloc] initWithTitle:title selectionHandler:selectionHandler];
}

@end

#pragma mark - GOActionSheet class

@interface GOActionSheet () <UIActionSheetDelegate>

@property (strong, nonatomic) NSMutableArray *buttons;

@end

@implementation GOActionSheet {
    
    UIActionSheet *actionSheet_;
    
    GOActionSheetButton *cancelActionSheetButton_;
}

- (instancetype)initWithTitle:(NSString *)title cancelActionSheetButton:(GOActionSheetButton *)cancelActionSheetButton {
    
    if (self = [super init]) {
        
        actionSheet_ = [UIActionSheet new];
        
        [actionSheet_ setDelegate:self];
        [actionSheet_ setTitle:title];
        
        cancelActionSheetButton_ = cancelActionSheetButton;
    }
    return self;
}

+ (instancetype)actionSheetWithTitle:(NSString *)title cancelActionSheetButton:(GOActionSheetButton *)cancelActionSheetButton {
    
    return [[self alloc] initWithTitle:title cancelActionSheetButton:cancelActionSheetButton];
}

- (NSMutableArray *)buttons {
    
    if (!_buttons) {
        
        _buttons = [NSMutableArray new];
    }
    
    return _buttons;
}

- (void)addActionSheetButton:(GOActionSheetButton *)actionSheetButton {
    
    [self.buttons insertObject:actionSheetButton atIndex:0];
}

- (void)prepareActionSheet {
    
    for (GOActionSheetButton *actionSheetButton in self.buttons) {
        
        [actionSheet_ addButtonWithTitle:actionSheetButton.title];
    }
    
    if (cancelActionSheetButton_) {
        
        [self.buttons addObject:cancelActionSheetButton_];
        [actionSheet_ addButtonWithTitle:cancelActionSheetButton_.title];
        [actionSheet_ setCancelButtonIndex:self.buttons.count - 1];
    }
}

#pragma mark - show methods from Apple

- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated {
    
    [self prepareActionSheet];
    
    [actionSheet_ showFromBarButtonItem:item animated:animated];
}

- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated {
    
    [self prepareActionSheet];
    
    [actionSheet_ showFromRect:rect inView:view animated:animated];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if ([self.buttons[buttonIndex] selectionHandler]) {
        
        [self.buttons[buttonIndex] selectionHandler](self.buttons[buttonIndex]);
    }
}
    
@end

//
//  GOActionSheet.h
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - GOActionSheetButton class

@interface GOActionSheetButton : NSObject

@property (strong, nonatomic) NSString *title;

@property (nonatomic, copy) void (^selectionHandler)(GOActionSheetButton *actionSheetButton);

+ (instancetype)actionSheetButtonWithTitle:(NSString *)title selectionHandler:(void (^)(GOActionSheetButton *actionSheetButton))selectionHandler;

@end

#pragma mark - GOActionSheet class

@interface GOActionSheet : NSObject

+ (instancetype)actionSheetWithTitle:(NSString *)title cancelActionSheetButton:(GOActionSheetButton *)cancelActionSheetButton;

- (void)addActionSheetButton:(GOActionSheetButton *)actionSheetButton;

- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated;

@end

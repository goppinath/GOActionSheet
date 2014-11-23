//
//  ViewController.m
//  GOActionSheet
//
//  Created by Goppinath Thurairajah on 18.11.14.
//  Copyright (c) 2014 Goppinath Thurairajah. All rights reserved.
//

#import "ViewController.h"

#import "GOActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    GOActionSheet *actionSheet_;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)actionBBITapped:(id)sender {
    
    actionSheet_ = [GOActionSheet actionSheetWithTitle:@"GOActionSheet" destructiveActionSheetButton:[GOActionSheetButton actionSheetButtonWithTitle:@"Destruct" selectionHandler:^(GOActionSheetButton *actionSheetButton) {
        
        NSLog(@"%@", @"Destructive button tapped");
        
    }] cancelActionSheetButton:[GOActionSheetButton actionSheetButtonWithTitle:@"Cancel" selectionHandler:^(GOActionSheetButton *actionSheetButton) {
        
        NSLog(@"%@", @"Cancel button tapped");
    }]];
    
    [actionSheet_ addActionSheetButton:[GOActionSheetButton actionSheetButtonWithTitle:@"Action 1" selectionHandler:^(GOActionSheetButton *actionSheetButton) {
        
        NSLog(@"%@", @"Action 1 button tapped");
    }]];
    
    [actionSheet_ addActionSheetButton:[GOActionSheetButton actionSheetButtonWithTitle:@"Action 2" selectionHandler:^(GOActionSheetButton *actionSheetButton) {
        
        NSLog(@"%@", @"Action 2 button tapped");
    }]];
    
//    [actionSheet_ setDestructiveButtonIndex:1];
    
    [actionSheet_ showFromBarButtonItem:sender animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

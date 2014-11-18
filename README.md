GOActionSheet
=============

UIActionSheet+block: Rethinking UIActionSheet with block

Even though the Apple's UIActionSheet has been replaced by UIAlertController still there is a necessity of an UIAlertController like implementation for UIActionSheet, because UIAlertController can only be used with the projects with the minimum development target iOS 8.

Adding variable number of buttons is really buggy with the UIActionSheet but GOActionSheet resolves the problem with the help of block.

Therefor I have rethought the UIActionSheet+block and wanted to dedicate to my mother on her  birthday November the 18th 2014.

Usage
=====

```Objective-C
- (IBAction)actionBBITapped:(id)sender {
    
    actionSheet_ = [GOActionSheet actionSheetWithTitle:@"GOActionSheet" cancelActionSheetButton:[GOActionSheetButton actionSheetButtonWithTitle:@"Cancel" selectionHandler:^(GOActionSheetButton *actionSheetButton) {
        
        NSLog(@"%@", @"Cancel button tapped");
    }]];
    
    [actionSheet_ addActionSheetButton:[GOActionSheetButton actionSheetButtonWithTitle:@"Action 1" selectionHandler:^(GOActionSheetButton *actionSheetButton) {
        
        NSLog(@"%@", @"Action 1 button tapped");
    }]];
    
    [actionSheet_ addActionSheetButton:[GOActionSheetButton actionSheetButtonWithTitle:@"Action 2" selectionHandler:^(GOActionSheetButton *actionSheetButton) {
        
        NSLog(@"%@", @"Action 2 button tapped");
    }]];
    
    [actionSheet_ showFromBarButtonItem:sender animated:YES];
}
```

NB: Don’t forget to own a strong reference of actionSheet object like this

```Objective-C
@implementation ViewController {
    
    GOActionSheet *actionSheet_;
}
```

Happy coding...

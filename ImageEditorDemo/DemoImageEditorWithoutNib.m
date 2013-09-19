//
//  DemoImageEditorWIthoutNib.m
//  ImageEditor
//
//  Created by Brian Michel on 9/19/13.
//  Copyright (c) 2013 Heitor Ferreira. All rights reserved.
//

#import "DemoImageEditorWithoutNib.h"
#import "HFImageEditorFrameView.h"

@interface DemoImageEditorWithoutNib ()
@end

@implementation DemoImageEditorWithoutNib {
    UIToolbar *_toolbar;
    UIBarButtonItem *_saveItem;
    UIBarButtonItem *_cancelItem;
}

- (id)init {
    self  = [super init];
    if (self) {
        HFImageEditorFrameView *frameView = [[[HFImageEditorFrameView alloc] initWithFrame:CGRectZero] autorelease];
        frameView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        self.frameView = frameView;
        
        _toolbar = [[UIToolbar alloc] init];
        _toolbar.translucent = YES;
        
        _saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(doneAction:)];
        _cancelItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Cancel", nil) style:UIBarButtonItemStyleBordered target:self action:@selector(cancelAction:)];
        
        UILabel *instructionLabel = [[[UILabel alloc] init] autorelease];
        instructionLabel.text = NSLocalizedString(@"Resize & Save", nil);
        instructionLabel.backgroundColor = [UIColor clearColor];
        [instructionLabel sizeToFit];
        
        UIBarButtonItem *instructionItem = [[[UIBarButtonItem alloc] initWithCustomView:instructionLabel] autorelease];
        UIBarButtonItem *flexSpace = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
        _toolbar.items = @[_cancelItem, flexSpace, instructionItem, flexSpace, _saveItem];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.clipsToBounds = YES;
    self.view.backgroundColor = [UIColor blackColor];
	// Do any additional setup after loading the view.
    self.frameView.frame = self.view.bounds;
    _toolbar.frame = CGRectMake(0, self.view.bounds.size.height - 44.0, self.view.bounds.size.width, 44.0);

    [self.view addSubview:self.frameView];
    [self.view addSubview:_toolbar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)dealloc {
    [_saveItem release];
    [_cancelItem release];
    [_toolbar release];
    
    [super dealloc];
}

@end

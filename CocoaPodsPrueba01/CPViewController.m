//
//  CPViewController.m
//  CocoaPodsPrueba01
//
//  Created by jorgeSV on 17/07/14.
//  Copyright (c) 2014 menus.es. All rights reserved.
//

#import "CPViewController.h"

#import <TRAutocompleteView/TRAutocompleteView.h>
#import <TRAutocompleteView/TRGoogleMapsAutocompleteItemsSource.h>
#import <TRAutocompleteView/TRGoogleMapsAutocompletionCellFactory.h>

 
@interface CPViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property TRAutocompleteView *autocompleteView;

@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _autocompleteView = [TRAutocompleteView autocompleteViewBindedTo:_textField usingSource:[[TRGoogleMapsAutocompleteItemsSource alloc] initWithMinimumCharactersToTrigger:3 language:@"es" apiKey:@"AIzaSyBfEbzhgPJh7rwk1PYzhcw9I-69EmcZ3CI" types:@"(cities)"] cellFactory:[[TRGoogleMapsAutocompletionCellFactory alloc] initWithCellForegroundColor: [UIColor lightGrayColor] fontSize:14] presentingIn:self];
    
    _autocompleteView.didAutocompleteWith = ^(id<TRSuggestionItem> item)
    {
        NSLog(@"Autocompleted with description: %@", item.completionText);
        NSLog(@"Autocompleted with id: %@", item.getID);
    };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

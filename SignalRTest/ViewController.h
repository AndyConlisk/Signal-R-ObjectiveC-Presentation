//
//  ViewController.h
//  SignalRTest
//
//  Created by Andrew Conlisk on 3/29/13.
//  Copyright (c) 2013 Andrew Conlisk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *chatName;

@property (nonatomic, strong) IBOutlet UITextView *chatText;

@property (nonatomic, strong) IBOutlet UITextField *chatMessage;

-(IBAction)chatButtonTapped:(id)sender;

@end

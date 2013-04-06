//
//  ViewController.m
//  SignalRTest
//
//  Created by Andrew Conlisk on 3/29/13.
//  Copyright (c) 2013 Andrew Conlisk. All rights reserved.
//

#import "ViewController.h"
#import "SignalR.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize chatName;
@synthesize chatText;
@synthesize chatMessage;
SRHubProxy *myHub;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    SRHubConnection *connection = [SRHubConnection connectionWithURL:@"http://pancakesignalr.azurewebsites.net"];
    myHub= [connection createHubProxy:@"ChatHub"];
    [myHub on:@"broadcastMessage" perform:self selector:@selector(notificationReceived: forMessage:)];
    [connection start];
    
}

- (void)notificationReceived:(id)name forMessage:(id)message
{
    //do something with the message
    NSLog(@"%@",message);
    self.chatText.text = [NSString stringWithFormat:@"%@\n %@ - %@", self.chatText.text, name, message];
}

- (IBAction)chatButtonTapped:(id)sender
{
    //self.chatText.text = [NSString stringWithFormat:@"Me - %@", self.chatMessage.text];
    
    [myHub invoke:@"send" withArgs:[NSArray arrayWithObjects:self.chatName.text, self.chatMessage.text, nil]];
    
    self.chatMessage.text = [NSString stringWithFormat:@""];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

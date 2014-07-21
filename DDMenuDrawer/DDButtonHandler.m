//
//  DDButtonHandler.m
//  DDMenuDrawer
//
//  Created by Ben Parks on 20/12/2013.
//  Copyright (c) 2013 Ben Parks. All rights reserved.
//

#import "DDButtonHandler.h"

@implementation DDButtonHandler

-(IBAction)handleButton:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notifyButtonPressed" object:self];
}

@end

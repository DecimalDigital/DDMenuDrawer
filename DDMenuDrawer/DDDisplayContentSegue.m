//
//  DDDisplayContentSegue.m
//  DDMenuDrawer
//
//  Created by Ben Parks on 19/12/2013.
//  Copyright (c) 2013 Ben Parks. All rights reserved.
//

#import "DDDisplayContentSegue.h"
#import "DDMenuViewController.h"
#import "DDMenuDrawerViewController.h"

@implementation DDDisplayContentSegue

-(void)perform
{
    DDMenuDrawerViewController* menuDrawerViewController = ((DDMenuViewController*)self.sourceViewController).menuDrawerViewController;
    menuDrawerViewController.content = self.destinationViewController;
}

@end

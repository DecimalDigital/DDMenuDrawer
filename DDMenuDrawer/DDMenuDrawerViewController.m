//
//  DDMenuDrawerViewController.m
//  DDMenuDrawer
//
//  Created by Ben Parks on 19/12/2013.
//  Copyright (c) 2013 Ben Parks. All rights reserved.
//

#import "DDMenuDrawerViewController.h"
#import "DDMenuViewController.h"

@interface DDMenuDrawerViewController ()

@property(nonatomic, weak) DDMenuViewController* menuViewController;

@end

@implementation DDMenuDrawerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(slideDrawer:) name:@"notifyButtonPressed" object:nil];

    [self.menuViewController performSegueWithIdentifier:@"displayText" sender:self.menuViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"embedMenu"])
    {
        DDMenuViewController* menuViewController = segue.destinationViewController;
        menuViewController.menuDrawerViewController = self;
        self.menuViewController = menuViewController;
    }
}

-(void)setContent:(UIViewController *)content
{
    if(_content)
    {
        [_content.view removeFromSuperview];
        [_content removeFromParentViewController];
        content.view.frame = _content.view.frame;
    }
    
    _content = content;
    [self addChildViewController:_content];
    [_content didMoveToParentViewController:self];
    [self.view addSubview:_content.view];
    
    [self closeDrawer];
}

-(void)slideDrawer:(id)sender
{
    if(self.content.view.frame.origin.x > 0)
    {
        [self closeDrawer];
    }
    else
    {
        [self openDrawer];
    }
}

-(void)openDrawer
{
    CGRect fm = self.content.view.frame;
    fm.origin.x = 240.0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.content.view.frame = fm;
    }];
}

-(void)closeDrawer
{
    CGRect fm = self.content.view.frame;
    fm.origin.x = 0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.content.view.frame = fm;
    }];
}

@end

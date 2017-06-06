//
//  AutoLayoutViewController.m
//  Demo
//
//  Created by Sam Meech-Ward on 2017-06-06.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomBlueConstraints;
@property (nonatomic, assign) BOOL toggled;

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *newView = [[UIView alloc] init];
    newView.backgroundColor = [UIColor magentaColor];
    [self.blueView addSubview:newView];
    
    // Auto Layout
    newView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:newView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.blueView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:16.0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:newView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-16.0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:newView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.blueView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-16.0];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:newView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.blueView attribute:NSLayoutAttributeTop multiplier:1.0 constant:16.0];
    
//    leftConstraint.active = YES;
//    bottomConstraint.active = YES;
//    rightConstraint.active = YES;
//    topConstraint.active = YES;
    
    [NSLayoutConstraint activateConstraints:@[leftConstraint, rightConstraint, bottomConstraint, topConstraint]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)toggleConstraints:(id)sender {
    self.toggled = !self.toggled;
    
    if (self.toggled) {
        self.bottomBlueConstraints.constant = 200;
    } else {
        self.bottomBlueConstraints.constant = 20;
    }
    
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

@end

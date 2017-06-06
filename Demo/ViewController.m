//
//  ViewController.m
//  Demo
//
//  Created by Sam Meech-Ward on 2017-06-06.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;

@property (nonatomic, assign) BOOL expanded;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doSomething:(id)sender {
    
    self.expanded = !self.expanded;
    
    
    [UIView animateWithDuration:1.0 delay:1.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:0 animations:^{
        if (self.expanded) {
            self.leftView.frame = CGRectMake(0, 0, 153, 500);
            self.rightView.frame = CGRectMake(190, 0, 153, 500);
            self.leftView.backgroundColor = [UIColor redColor];
            self.rightView.alpha = 0.5;
        } else {
            self.leftView.frame = CGRectMake(0, 0, 153, 100);
            self.rightView.frame = CGRectMake(190, 0, 153, 100);
            self.leftView.backgroundColor = [UIColor yellowColor];
            self.rightView.alpha = 1.0;
        }
    } completion:^(BOOL finished) {
        NSLog(@"Animation comp;lete");
    }];
    
    NSLog(@"animation did begin");
    
    UIView *newView = [[UIView alloc] init];
    newView.backgroundColor = [UIColor blueColor];
    
    CGFloat screenHeight = self.view.bounds.size.height;
    CGFloat screenWidth = self.view.bounds.size.width;
    
    CGFloat randomX = arc4random_uniform(screenWidth);
    CGFloat randomY = arc4random_uniform(screenHeight);
    
    newView.frame = CGRectMake(randomX, randomY, 100, 100);
    
    [self.containerView addSubview:newView];

}


@end

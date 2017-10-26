//
//  ViewController.m
//  project4
//
//  Created by Harvey Wang on 10/22/17.
//  Copyright © 2017 Harvey Wang. All rights reserved.
//

#import "ViewController.h"
#import "DistanceGetter/DGDistanceRequest.h"


@interface ViewController ()

@property (nonatomic) DGDistanceRequest *req;

@property (weak, nonatomic) IBOutlet UITextField *startLocation;

@property (weak, nonatomic) IBOutlet UITextField *endLocationA;
@property (weak, nonatomic) IBOutlet UILabel *distanceA;

@property (weak, nonatomic) IBOutlet UITextField *endLocationB;
@property (weak, nonatomic) IBOutlet UILabel *distanceB;
@property (weak, nonatomic) IBOutlet UITextField *endLocationC;
@property (weak, nonatomic) IBOutlet UILabel *distanceC;

@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@end

@implementation ViewController
- (IBAction)calculateButtonTapped:(id)sender {
    self.calculateButton.enabled=NO;
    self.req=[DGDistanceRequest alloc];
    NSString *start=self.startLocation.text;
    NSString *destA=self.endLocationA.text;
    NSString *destB=self.endLocationB.text;
    NSString *destC=self.endLocationC.text;
    NSArray *dests= @[destA,destB,destC];
    self.req=[self.req initWithLocationDescriptions:dests sourceDescription:start];
    
    __weak ViewController *weakSelf=self;
    
    self.req.callback=^void (NSArray *responses){
        ViewController *strongSelf= weakSelf;
        if(!strongSelf)return;
        NSNull *badresult=[NSNull null];
        
        if(responses[0]!=badresult){
            double num1 =([responses[0] floatValue]/1000.0);
            NSString *x = [NSString stringWithFormat:@"%.2f km", num1];
            strongSelf.distanceA.text=x;
        }else {strongSelf.distanceA.text=@"error";}
        
        if(responses[1]!=badresult){
            double num2 =([responses[1] floatValue]/1000.0);
            NSString *y = [NSString stringWithFormat:@"%.2f km", num2];
            strongSelf.distanceA.text=y;
        }else {strongSelf.distanceB.text=@"error";}
       
        if(responses[2]!=badresult){
            double num3 =([responses[2] floatValue]/1000.0);
            NSString *z = [NSString stringWithFormat:@"%.2f km", num3];
            strongSelf.distanceA.text=z;
        }else {strongSelf.distanceC.text=@"error";}
        
        strongSelf.req=nil;
        strongSelf.calculateButton.enabled=YES;
        
    };
    
    [self.req start];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

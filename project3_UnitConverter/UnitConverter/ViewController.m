//
//  ViewController.m
//  UnitConverter
//
//  Created by Harvey Wang on 10/16/17.
//  Copyright © 2017 Harvey Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;

@property (weak, nonatomic) IBOutlet UILabel *outputField;

@end

double convertUnitOneToUnitTwo(double unitOneValue){
    return unitOneValue/1000;
}
double convertUnitOneToUnitThree(double unitTwoValue){
    return unitTwoValue*100;
}
double convertUnitOneToUnitFour(double unitThreeValue){
    return unitThreeValue*0.000621371;
}
@implementation ViewController
- (IBAction)updateButton:(id)sender {
    NSMutableString *buf=[NSMutableString new];
    double userInput=[self.inputField.text doubleValue];
    if(self.segmentController.selectedSegmentIndex==0){
        double unitTwoValue=convertUnitOneToUnitTwo(userInput);
        [buf appendString: [@(unitTwoValue)stringValue]];}
    else if(self.segmentController.selectedSegmentIndex==1){double unitThreeValue=convertUnitOneToUnitThree(userInput);
        [buf appendString: [@(unitThreeValue)stringValue]];}
    else if(self.segmentController.selectedSegmentIndex==2){double unitFourValue=convertUnitOneToUnitFour(userInput);
        [buf appendString: [@(unitFourValue)stringValue]];}
    
    self.outputField.text = buf;
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

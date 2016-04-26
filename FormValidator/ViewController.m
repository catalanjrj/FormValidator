//
//  ViewController.m
//  FormValidator
//
//  Created by Jorge Catalan on 4/26/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import "ViewController.h"
#import "FormValidator.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;

@property (strong,nonatomic) FormValidator* formValidator;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 self.addressTextField.placeholder = @"Address";
   self.formValidator = [[FormValidator alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//called when the enter key is pressed. return NO to ignore.
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([textField isEqual:self.nameTextField]) {
        if( [self.formValidator validateName:self.nameTextField.text]){
            [self.nameTextField resignFirstResponder];
            [self.addressTextField becomeFirstResponder];
            return YES;
            
        }
           
        
//    return [[textField.text componentsSeparatedByString:@" "] count] >1;
    
    }else if ([textField isEqual:self.addressTextField]){
        return [self.formValidator isValidAddress:self.addressTextField.text];
        
    }else if ([textField isEqual:self.zipTextField]){
        return [self.formValidator isZipCode: self.zipTextField.text];
    
    }
    
    return NO;

}


@end

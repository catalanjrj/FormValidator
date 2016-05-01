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
@property (weak,nonatomic) IBOutlet UITextField *cityTextField;
@property(weak,nonatomic)IBOutlet UITextField *stateTextField;
@property(weak,nonatomic)IBOutlet UITextField *phoneNumberTextField;

@property (strong,nonatomic) FormValidator* formValidator;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"Validator";
    
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
        }
            return YES;
            
        
           
        
//    return [[textField.text componentsSeparatedByString:@" "] count] >1;
    
    }else if ([textField isEqual:self.addressTextField]){
        if ([self.formValidator isValidAddress:textField.text]) {
        [self.addressTextField resignFirstResponder];
        [self.cityTextField becomeFirstResponder];
        }
        
        
        return YES;
            
        }else if ([textField isEqual:self.cityTextField]){
            if ([self.formValidator isValidCity:textField.text]) {
                [self.cityTextField resignFirstResponder];
                [self.stateTextField becomeFirstResponder];
            }
                return YES;
            }else if ([textField isEqual:self.stateTextField]){
                if ([self.formValidator isValidState:textField.text]) {
                    [self.stateTextField resignFirstResponder];
                    [self.zipTextField becomeFirstResponder];
                }
                    return YES;
                }else if ([textField isEqual:self.zipTextField]){
                    if ([self.formValidator isZipCode:textField.text]) {
                        [self.zipTextField resignFirstResponder];
                        [self.phoneNumberTextField becomeFirstResponder];
                    }
                        return YES;
                
                }else if ([textField isEqual:self.phoneNumberTextField]){
                    if ([self.formValidator isValidPhoneNumber:textField.text]) {
                        [self.phoneNumberTextField resignFirstResponder];
                    }
                    return YES;
                }

            

        

    
    return NO;
}
                    
            



    @end

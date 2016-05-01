//
//  FormValidator.h
//  FormValidator
//
//  Created by Jorge Catalan on 4/26/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormValidator : NSObject

-(BOOL) validateName:(NSString*)nameString;

-(BOOL) isValidAddress:(NSString*)addressString;

-(BOOL) isZipCode: (NSString*)zipCode;
-(BOOL) isValidCity:(NSString*)city;
-(BOOL) isValidPhoneNumber:(NSString*)phoneNumber;
-(BOOL) isValidState:(NSString*)state;
@end

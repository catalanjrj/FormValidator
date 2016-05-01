//
//  FormValidator.m
//  FormValidator
//
//  Created by Jorge Catalan on 4/26/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import "FormValidator.h"

@implementation FormValidator

-(BOOL) validateName:(NSString*)nameString {
  return [[nameString componentsSeparatedByString:@" "] count] >1;

}
-(BOOL) isValidAddress:(NSString*)addressString{
    NSTextCheckingType detectorType = NSTextCheckingTypeAddress;
    //create place to hold error if error is created
    NSError * error ;
    
    
    NSDataDetector * dataDetector = [NSDataDetector dataDetectorWithTypes:detectorType error:&error];
    //special block BOOL used only in block.
    __block BOOL rc = NO;
    
    [dataDetector enumerateMatchesInString:addressString options:kNilOptions range:NSMakeRange(0, [addressString length]) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        rc = YES;
    }];
    
    return rc;
}
-(BOOL) isZipCode:(NSString *)zipCodeString{
    BOOL rc = NO;
    
    NSCharacterSet * set =[NSCharacterSet characterSetWithCharactersInString:@"1234567890"];
    
    rc = ([zipCodeString length] ==5)&&([zipCodeString rangeOfCharacterFromSet:set].location != NSNotFound);
    
    return rc;

}
- (BOOL)isValidCity:(NSString *)city {
    return city.length > 0;
}

- (BOOL)isValidState:(NSString *)state {
    return state.length == 2;
}
- (BOOL)isValidPhoneNumber:(NSString *)phoneNumber{
    NSTextCheckingType detectorType = NSTextCheckingTypePhoneNumber;
    
    NSError *error;
    
    // dataDetector
    NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:detectorType error:&error];
    
    
    __block BOOL rc = NO;
    [dataDetector enumerateMatchesInString:phoneNumber options:kNilOptions range:NSMakeRange(0, phoneNumber.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        rc = YES;
    }];
    
    return rc;
}


@end

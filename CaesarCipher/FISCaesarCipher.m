//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//define methods here
-(NSString *)encodeMessage:(NSString *)message
                withOffset:(NSInteger)key{
    NSMutableString *encodedSentence = [[NSMutableString alloc]init];
    char encodedLetter;
    char aLetter;
    key = key%26;

    
    

    for(NSUInteger i = 0; i <[message length]; i++){
        aLetter = [message characterAtIndex:i];

        if ((aLetter >= 65 && aLetter <= 90)||(aLetter >= 97 && aLetter<= 122)){
            encodedLetter  = [message characterAtIndex:i] +key;
            
            
            
            if ((encodedLetter >= 65 && encodedLetter <= 90)||(encodedLetter >= 97 && encodedLetter <= 122)) {
                [encodedSentence appendFormat:@"%c", encodedLetter];
            }else {
                [encodedSentence appendFormat:@"%c", encodedLetter-26];

            }
    
        }else {
            encodedLetter  = [message characterAtIndex:i];
            [encodedSentence appendFormat:@"%c", encodedLetter];
        }
    }
        return  encodedSentence;
}

-(NSString *)decodeMessage:(NSString *)encodedMessage
                withOffset:(NSInteger)key{
    

    NSMutableString *decodedSentence = [[NSMutableString alloc]init];
    char decodedLetter;
    char aLetter;
    key = key%26;
    
    
    
    
    for(NSUInteger i = 0; i <[encodedMessage length]; i++){
        aLetter = [encodedMessage characterAtIndex:i];
        
        
        if (aLetter >= 65 && aLetter <= 90) {
            decodedLetter  = [encodedMessage characterAtIndex:i] -key;
            if (decodedLetter >= 65 && decodedLetter <= 90) {
                [decodedSentence appendFormat:@"%c", decodedLetter];
            }else{
            [decodedSentence appendFormat:@"%c", decodedLetter+26];
            }
        }else if (aLetter >= 97 && aLetter<= 122){
        decodedLetter  = [encodedMessage characterAtIndex:i] -key;
            if (decodedLetter >= 97 && decodedLetter <= 122) {
                [decodedSentence appendFormat:@"%c", decodedLetter];
            }else{
                [decodedSentence appendFormat:@"%c", decodedLetter+26];
            }
        }else {
            decodedLetter  = [encodedMessage characterAtIndex:i];
            [decodedSentence appendFormat:@"%c", decodedLetter];
        }
    }
    return  decodedSentence;
}


@end

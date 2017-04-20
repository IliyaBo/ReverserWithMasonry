//
//  SBDReverser.m
//  Reverser
//
//  Created by Alexey Ulenkov on 25.02.17.
//  Copyright © 2017 Alexey Ulenkov. All rights reserved.
//

#import "SBDReverser.h"

@implementation SBDReverser

+ (nullable NSString *)reverseString:(nullable NSString *)source {
    if (nil == source)
    {
        return source;
    }
    
    NSMutableString *reversedString = [[NSMutableString alloc] initWithCapacity: source.length];
    NSUInteger characterIndex = source.length;
    NSUInteger incrementLenght = 1;
    while (characterIndex > 0) {
        --characterIndex;
        NSRange iterationIncrement = NSMakeRange(characterIndex, incrementLenght);
        [reversedString appendString:[source substringWithRange:iterationIncrement]];
    }
    return [reversedString copy];
}

@end


//
//  Language.h
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLparser.h"

#define LANGUAGE [NSHomeDirectory() stringByAppendingString:@"/Documents/LANG.TXT"]
#define LANGFILE [[NSBundle mainBundle] pathForResource:@"language" ofType:@"xml"]

@interface Language : NSObject {
    
}

+ (NSString*)currentLanguage;
+ (NSArray*)getTextArray;
+ (NSString*)getText:(NSString*)element;
+ (void)saveCurrentLanguage:(NSString*)language;

@end

//
//  XMLparser.h
//  ogcio
//
//  Created by MGIE on 30/12/2010.
//  Copyright 2010 Company. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAINTYPE @"MAIN_TYPE"


@interface XMLparser : NSObject <NSXMLParserDelegate> {
	NSMutableArray *stack_tab;
	NSMutableDictionary *element;
	NSMutableArray *outArray;
}

@property(nonatomic, readonly) int tagNum;

- (id)initWithXML:(NSString*)xml;
- (NSArray *)getArray;
- (void)print;

@end

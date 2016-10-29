//
//  XMLparser.m
//  ogcio
//
//  Created by MGIE on 30/12/2010.
//  Copyright 2010 Company. All rights reserved.
//

#import "XMLparser.h"


@implementation XMLparser

@synthesize tagNum;

- (id)initWithXML:(NSString*)xml
{
	stack_tab = [[NSMutableArray alloc] init];
	outArray = [[NSMutableArray alloc] init];
	element = NULL;
	
	NSData *xmlDate = [xml dataUsingEncoding:NSUTF8StringEncoding];
	NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithData:xmlDate];
	[xmlparser setDelegate:self];
	[xmlparser parse];
//	BOOL parserStatus = [xmlparser parse];
	[xmlparser release];
	xmlparser = NULL;
	
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	[stack_tab addObject:elementName];
	if ([stack_tab count] == 1)
	{
	}
	else if ([stack_tab count] == 2)
	{
		element = [[NSMutableDictionary alloc] init];
		[element setObject:[stack_tab lastObject] forKey:MAINTYPE];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if ([stack_tab count] <= 2 || 
		[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])
		return;
	else
	{
		if ([element objectForKey:[stack_tab lastObject]] == NULL)
			[element setObject:string forKey:[stack_tab lastObject]];
		else
		{
			NSString *passString = [NSString stringWithString:[element objectForKey:[stack_tab lastObject]]];
			passString = [passString stringByAppendingString:string];
			[element setObject:passString forKey:[stack_tab lastObject]];
		}
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if ([stack_tab count] == 2)
	{
		[outArray addObject:element];
		[element release];
		element = NULL;
	}
	if ([stack_tab count] != 0)
	{
		[stack_tab removeLastObject];
	}
}

- (void)dealloc
{
	[outArray release];
	[stack_tab release];
	[element release];
	[super dealloc];
}

//- (int)count
//{
//	return [elementsList count];
//}

- (NSArray *)getArray
{
	return outArray;
}

- (void)print
{
}

@end

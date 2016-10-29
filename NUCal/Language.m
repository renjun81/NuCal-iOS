//
//  Language.m
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Language.h"

@implementation Language

static NSArray *textArray;
static NSString *lang;

+ (NSString*)currentLanguage
{
	if (lang == NULL)
	{
		if (![[NSFileManager defaultManager] fileExistsAtPath:LANGUAGE])
		{
			NSArray * currentLocale = [NSLocale preferredLanguages];
			NSString *langString = [currentLocale objectAtIndex:0];
			if ([langString isEqualToString:@"zh-Hant"])
				[self saveCurrentLanguage:@"zh"];
			else if ([langString isEqualToString:@"zh-Hans"])
				[self saveCurrentLanguage:@"sc"];
			else
				[self saveCurrentLanguage:@"en"];
		}
		NSError *error = NULL;
		NSString *language = [NSString stringWithContentsOfFile:LANGUAGE encoding:NSUTF8StringEncoding error:&error];
		if (error)
		{
			language = @"zh";
		}
		lang = [[NSString alloc] initWithString:language];
	}
	return lang;
}

+ (NSArray*)getTextArray
{
	if (textArray == NULL)
	{
		NSError *error = NULL;
		NSString *xml = [NSString stringWithContentsOfFile:LANGFILE encoding:NSUTF8StringEncoding error:&error];
		if (error)
			return NULL;
		
		XMLparser *xmlParser = [[XMLparser alloc] initWithXML:xml];
		textArray = [[NSArray alloc] initWithArray:[xmlParser getArray]];
		[xmlParser release];
	}
	return textArray;
}

+ (NSString*)getText:(NSString*)element
{
	NSString *currentlang = [Language currentLanguage];
//    NSLog(@"Current Language = %@", currentlang);
	NSString *returnStr = @"";
    int i = 0;
	for (NSDictionary *dict in [Language getTextArray])
	{
//        NSLog(@"No.%i %@",i, dict);
//        NSLog(@"MainType = %@, element = %@", MAINTYPE, element);
		if ([[dict objectForKey:MAINTYPE] isEqualToString:currentlang])
		{
//            NSLog(@"YES");
			returnStr = [dict objectForKey:element];
//            NSLog(@"returnStr change to : %@", returnStr);
            if(returnStr != nil)break;
		}
		else
		{
			continue;
		}
//        i++;
	}
	return returnStr;
}

+ (void)saveCurrentLanguage:(NSString*)language
{
	NSError *error = NULL;
	[language writeToFile:LANGUAGE atomically:YES encoding:NSUTF8StringEncoding error:&error];
	[textArray release];
	textArray = NULL;
	[lang release];
	lang = NULL;
	[self currentLanguage];
	[self getTextArray];
}

@end

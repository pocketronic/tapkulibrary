//
//  FoundationTests.m
//  Created by Devin Ross on 4/6/11.
//
/*
 
 tapku.com || http://github.com/devinross/tapkulibrary
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
*/

#import "FoundationTests.h"

@implementation FoundationTests


- (void) testDateCategory{
	
    NSDate *date,*date2;
    
	date = [NSDate date];
    STAssertTrue([date isToday],@"Expected %@ is today.",date);
    
	date = [NSDate yesterday];
    STAssertFalse([date isToday],@"Expected %@ is not today.",date);
    
    date = [NSDate dateWithTimeIntervalSinceNow:-60 * 60 * 40];
    STAssertFalse([date isToday],@"Expected %@ is not today.",date);
    
	
    date = [NSDate yesterday];
    date2 = [NSDate date];
    STAssertFalse([date isSameDay:date2],@"Expected %@ is not same day as %@.",date,date2);
    
    
    date = [NSDate date];
	NSDateComponents *comp = [date dateComponentsWithTimeZone:[NSTimeZone defaultTimeZone]];
    comp.day = 1;
    comp.hour = comp.minute = comp.second = 0;
    date2 = [NSDate dateWithDateComponents:comp];
	
    STAssertTrue([date2 isSameDay:[date monthDate] timeZone:[NSTimeZone defaultTimeZone]], @"Expected %@ is same day as %@.",date2,date);
    
    date = [NSDate date];
    date2 = [NSDate yesterday];
    STAssertEquals([date daysBetweenDate:date2], 1, @"Expected difference between %@ and %@ is zero.",date,date2);
	
	
}


@end

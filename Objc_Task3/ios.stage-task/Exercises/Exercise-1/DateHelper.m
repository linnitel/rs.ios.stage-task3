#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber > 0 && monthNumber <= 12) {
        NSString *dateNumString = [NSString stringWithFormat: @"%lu", monthNumber];
        NSDateFormatter* dateNumFormat = [NSDateFormatter new];
        [dateNumFormat setDateFormat:@"MM"];
        NSDate* date = [dateNumFormat dateFromString:dateNumString];
        NSDateFormatter *dateStringFormat = [NSDateFormatter new];
        [dateStringFormat setDateFormat:@"MMMM"];
        return [dateStringFormat stringFromDate:date];
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateStringFormat = [NSDateFormatter new];
    [dateStringFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate* myDate = [dateStringFormat dateFromString:date];
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components: NSCalendarUnitDay fromDate:myDate];
    NSInteger myDay = [dateComp day];
    return myDay;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    [dateFormat setDateFormat:@"EE"];
    dateFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    return [dateFormat stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *dateNow = [NSDate now];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ru"]];
    NSDateComponents *dateThis = [calendar components:NSCalendarUnitWeekOfYear fromDate: dateNow];
    NSDateComponents *dateGiven = [calendar components: NSCalendarUnitWeekOfYear fromDate: date];
    NSInteger dateThisNum = [dateThis weekOfYear];
    NSInteger dateGivenNum = [dateGiven weekOfYear];
    if (dateThisNum == dateGivenNum) {
        return YES;
    }
    return NO;
}

@end

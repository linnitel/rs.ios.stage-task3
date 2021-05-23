#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber > 0 && monthNumber <= 12) {
        NSString *dateNumString = [NSString stringWithFormat: @"%lu", monthNumber];
        NSDateFormatter* dateNumFormat = [NSDateFormatter new];
        if (monthNumber < 10) {
            [dateNumFormat setDateFormat:@"M"];
        }
        else {
            [dateNumFormat setDateFormat:@"MM"];
        }
        NSDate* date = [dateNumFormat dateFromString:dateNumString];
        NSDateFormatter *dateStringFormat = [NSDateFormatter new];
        [dateStringFormat setDateFormat:@"MMMM"];
        return [dateStringFormat stringFromDate:date];
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    return 0;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    return NO;
}

@end

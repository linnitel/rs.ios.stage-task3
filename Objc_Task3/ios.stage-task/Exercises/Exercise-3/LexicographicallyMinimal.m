#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSString *str1 = [[NSString alloc] initWithString:string1];
    NSString *str2 = [[NSString alloc] initWithString:string2];
    NSMutableString *composedString = [NSMutableString new];
    while (str1.length > 0 || str2.length > 0) {
        if (str1.length == 0) {
            unichar testCharTwo = [str2 characterAtIndex:0];
            [composedString appendString:[NSString stringWithFormat: @"%C", testCharTwo]];
            str2 = [str2 substringFromIndex:1];
        }
        else if (str2.length == 0) {
            unichar testCharOne = [str1 characterAtIndex:0];
            [composedString appendString:[NSString stringWithFormat: @"%C", testCharOne]];
            str1 = [str1 substringFromIndex:1];
        }
        else {
            unichar testCharOne = [str1 characterAtIndex:0];
            unichar testCharTwo = [str2 characterAtIndex:0];
            if (testCharOne <= testCharTwo) {
                [composedString appendString:[NSString stringWithFormat: @"%C", testCharOne]];
                str1 = [str1 substringFromIndex:1];
            }
            else {
                [composedString appendString:[NSString stringWithFormat: @"%C", testCharTwo]];
                str2 = [str2 substringFromIndex:1];
            }
        }
    }
    self->_resultString = composedString;
    return self->_resultString;
}

@end

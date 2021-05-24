#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger number = 0;
    for (NSInteger index = 0; index + 2 < ratingArray.count; index++) {
        for (NSInteger indexTwo = 1;  index + indexTwo + 1 < ratingArray.count; indexTwo++) {
            for (NSInteger indexThree = 1; index + indexTwo + indexThree < ratingArray.count; indexThree++) {
                if (([ratingArray[index] intValue] < [ratingArray[index + indexTwo] intValue] && [ratingArray[index + indexTwo] intValue] < [ratingArray[index + indexTwo + indexThree] intValue]) || ([ratingArray[index] intValue] > [ratingArray[index + indexTwo] intValue] && [ratingArray[index + indexTwo] intValue] > [ratingArray[index + indexTwo + indexThree] intValue])) {
                    number++;
                }
            }
        }
    }
    return number;
}

@end

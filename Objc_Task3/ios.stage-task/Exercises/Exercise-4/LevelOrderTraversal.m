#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray *levelOrderedTree = [[NSMutableArray alloc] initWithArray:@[]];
    if (tree.count > 0 && tree[0] == [NSNull null]) {
        return @[];
    }
    NSMutableArray *levelSaver = [NSMutableArray new];
    NSInteger index = 0;
    NSInteger levelCounter = 0;
    BOOL firstNill = true;
    for (id element in tree) {
        if (element == [NSNull null]) {
            if (firstNill) {
                [levelSaver removeObject:[NSNumber numberWithInteger:levelCounter]];
                firstNill = false;
            }
            else {
                levelCounter = [[levelSaver lastObject] integerValue];
                firstNill = true;
            }
        }
        else if (element != [NSNull null]){
            if (levelCounter >= index) {
                [levelSaver addObject:[NSNumber numberWithInteger:levelCounter]];
                [levelOrderedTree addObject:[NSMutableArray new]];
                index = levelCounter;
            }
            [levelOrderedTree[levelCounter] addObject:element];
            levelCounter++;
        }
    }
    if (levelOrderedTree.count > 1) {
        [levelOrderedTree removeObject:[levelOrderedTree lastObject]];
    }
    NSArray *final = levelOrderedTree;
    return final;
}

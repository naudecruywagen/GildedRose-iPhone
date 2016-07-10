#import "Item.h"

@implementation Item

+ (Item *)itemWithName:(NSString *)name sellIn:(int)sellIn andQuality:(int)quality {
    Item *item = [Item new];
    item.name = name;
    item.sellIn = sellIn;
    item.quality = quality;

    return item;
}

@end

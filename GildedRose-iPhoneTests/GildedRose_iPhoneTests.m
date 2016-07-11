#import <XCTest/XCTest.h>
#import "Item.h"
#import "GildedRoseViewController.h"

@interface GildedRose_iPhoneTests : XCTestCase

@end

@implementation GildedRose_iPhoneTests

- (GildedRoseViewController *)updateQualityForItem:(Item *)item {
    GildedRoseViewController *gildedRoseViewController = [[GildedRoseViewController alloc] initWithNibName:nil
                                                                                                    bundle:nil];
    gildedRoseViewController.items = @[item];

    [gildedRoseViewController tableView:gildedRoseViewController.tableView
                didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0
                                                           inSection:0]];
    return gildedRoseViewController;
}

- (void)testThatQuality_ShouldDecreaseTwiceAsFast_WhenSellByDatePassed {
    Item *item = [Item itemWithName:@"+5 Dexterity Vest" sellIn:1 andQuality:20];

    GildedRoseViewController *gildedRoseViewController = [self updateQualityForItem:item];

    XCTAssertEqual(19, item.quality);

    [gildedRoseViewController tableView:gildedRoseViewController.tableView
                didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0
                                                           inSection:0]];

    XCTAssertEqual(17, item.quality);
}

- (void)testThatQuality_ShouldNeverBeNegative {
    Item *item = [Item itemWithName:@"+5 Dexterity Vest" sellIn:1 andQuality:0];

    [self updateQualityForItem:item];

    XCTAssertEqual(0, item.quality);
}

- (void)testThatQuality_ShouldNeverBeGreaterThan50 {
    Item *item = [Item itemWithName:@"Aged Brie" sellIn:50 andQuality:50];

    [self updateQualityForItem:item];

    XCTAssertEqual(50, item.quality);
}

- (void)testThatBrie_ShouldIncreaseInQualityWithAge {
    Item *item = [Item itemWithName:@"Aged Brie" sellIn:1 andQuality:0];

    [self updateQualityForItem:item];

    XCTAssertEqual(1, item.quality);
}

- (void)testThatBrie_ShouldIncreaseTwiceAsFast_WhenSellByDatePassed {
    Item *item = [Item itemWithName:@"Aged Brie" sellIn:0 andQuality:0];

    [self updateQualityForItem:item];

    XCTAssertEqual(2, item.quality);
}

- (void)testThatSulfuras_ShouldNotDescreaseInQuality {
    Item *item = [Item itemWithName:@"Sulfuras, Hand of Ragnaros" sellIn:0 andQuality:80];

    [self updateQualityForItem:item];

    XCTAssertEqual(80, item.quality);
}

- (void)testThatSulfuras_ShouldNotDecreaseSellByDate {
    Item *item = [Item itemWithName:@"Sulfuras, Hand of Ragnaros" sellIn:1 andQuality:80];

    [self updateQualityForItem:item];

    XCTAssertEqual(1, item.sellIn);
}

- (void)testThatBackstagePasses_ShouldIncreaseQualityBy1_WhenSellByDateOver10 {
    Item *item = [Item itemWithName:@"Backstage passes to a TAFKAL80ETC concert" sellIn:15 andQuality:20];

    [self updateQualityForItem:item];

    XCTAssertEqual(21, item.quality);
}

- (void)testThatBackstagePasses_ShouldIncreaseQualityBy2_WhenSellByDateOver5_AndLessThanEqual10 {
    Item *item = [Item itemWithName:@"Backstage passes to a TAFKAL80ETC concert" sellIn:10 andQuality:20];

    [self updateQualityForItem:item];

    XCTAssertEqual(22, item.quality);
}

- (void)testThatBackstagePasses_ShouldIncreaseQualityBy3_WhenSellByDateLessThanEqual5 {
    Item *item = [Item itemWithName:@"Backstage passes to a TAFKAL80ETC concert" sellIn:5 andQuality:20];

    [self updateQualityForItem:item];

    XCTAssertEqual(23, item.quality);
}

- (void)testThatBackstagePasses_ShouldZeroQuality_WhenSellByDateZero {
    Item *item = [Item itemWithName:@"Backstage passes to a TAFKAL80ETC concert" sellIn:0 andQuality:20];

    [self updateQualityForItem:item];

    XCTAssertEqual(0, item.quality);
}

@end

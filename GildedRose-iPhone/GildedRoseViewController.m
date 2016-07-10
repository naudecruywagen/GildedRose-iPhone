#import "GildedRoseViewController.h"
#import "Item.h"

@implementation GildedRoseViewController

- (instancetype)initWith:(NSArray<Item *> *)items {
    self = [self initWithStyle:UITableViewStylePlain];
    if (self) {
        _items = items;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:@"ItemCellIdentifier"];
    }
    cell.textLabel.text = [self.items[(NSUInteger) indexPath.row] name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Quality: %lu, Sell in: %lu",
                                                           (unsigned long) [self.items[(NSUInteger) indexPath.row] quality],
                                                           (unsigned long) [self.items[(NSUInteger) indexPath.row] sellIn]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = (NSUInteger) indexPath.row;
    if (![[self.items[row] name] isEqualToString:@"Aged Brie"] && ![[self.items[row] name] isEqualToString:@"Backstage passes to a TAFKAL80ETC concert"]) {
        if ([self.items[row] quality] > 0) {
            if (![[self.items[row] name] isEqualToString:@"Sulfuras, Hand of Ragnaros"]) {
                [self.items[row] setQuality:[self.items[row] quality] - 1];
            }
        }
    }
    else {
        if ([self.items[row] quality] < 50) {
            [self.items[row] setQuality:[self.items[row] quality] + 1];
            if ([[self.items[row] name] isEqualToString:@"Backstage passes to a TAFKAL80ETC concert"]) {
                if ([self.items[row] sellIn] < 11) {
                    if ([self.items[row] quality] < 50) {
                        [self.items[row] setQuality:[self.items[row] quality] + 1];
                    }
                }
                if ([self.items[row] sellIn] < 6) {
                    if ([self.items[row] quality] < 50) {
                        [self.items[row] setQuality:[self.items[row] quality] + 1];
                    }
                }
            }
        }
    }
    if (![[self.items[row] name] isEqualToString:@"Sulfuras, Hand of Ragnaros"]) {
        [self.items[row] setSellIn:[self.items[row] sellIn] - 1];
    }
    if ([self.items[row] sellIn] < 0) {
        if (![[self.items[row] name] isEqualToString:@"Aged Brie"]) {
            if (![[self.items[row] name] isEqualToString:@"Backstage passes to a TAFKAL80ETC concert"]) {
                if ([self.items[row] quality] > 0) {
                    if (![[self.items[row] name] isEqualToString:@"Sulfuras, Hand of Ragnaros"]) {
                        [self.items[row] setQuality:[self.items[row] quality] - 1];
                    }
                }
            }
            else {
                [self.items[row] setQuality:[self.items[row] quality] - [self.items[row] quality]];
            }
        }
        else {
            if ([self.items[row] quality] < 50) {
                [self.items[row] setQuality:[self.items[row] quality] + 1];
            }
        }
    }
}


@end

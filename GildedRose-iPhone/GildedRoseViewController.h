#import <UIKit/UIKit.h>

@class Item;

@interface GildedRoseViewController : UITableViewController

@property (nonatomic, strong) NSArray<Item *> *items;

- (instancetype)initWith:(NSArray<Item *> *)items;

@end


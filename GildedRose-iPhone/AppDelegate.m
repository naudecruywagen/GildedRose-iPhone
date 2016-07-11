#import "AppDelegate.h"
#import "GildedRoseViewController.h"
#import "Item.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UINavigationController *navigationController = (UINavigationController *) [UIApplication sharedApplication].delegate.window.rootViewController;
    GildedRoseViewController *gildedRoseViewController = (GildedRoseViewController *) navigationController.topViewController;
    gildedRoseViewController.items = @[
            [Item itemWithName:@"Aged Brie"
                        sellIn:30
                    andQuality:20],
            [Item itemWithName:@"Backstage passes to a TAFKAL80ETC concert"
                        sellIn:60
                    andQuality:15],
            [Item itemWithName:@"Sulfuras, Hand of Ragnaros"
                        sellIn:100
                    andQuality:80]
    ];
    return YES;
}

@end

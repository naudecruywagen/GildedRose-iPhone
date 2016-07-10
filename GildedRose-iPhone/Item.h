#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger sellIn;
@property (nonatomic) NSInteger quality;

+ (Item *)itemWithName:(NSString *)name sellIn:(int)sellIn andQuality:(int)quality;

@end

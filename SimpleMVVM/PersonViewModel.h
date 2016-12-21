#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonViewModel : NSObject

- (instancetype)initWithPerson:(Person *)person;

@property (nonatomic, readonly) Person *person;
@property (nonatomic, readonly) NSString *nameText;
@property (nonatomic, readonly) NSString *birthDateText;

@end

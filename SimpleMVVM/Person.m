#import "Person.h"

@implementation Person

// Object initialization here!

- (instancetype)initWithSalutation:(NSString *)salutation name:(NSString *)name birthDate:(NSDate *)birthDate {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _salutation = salutation;
    _name = name;
    _birthDate = birthDate;
    
    return self;
}

@end

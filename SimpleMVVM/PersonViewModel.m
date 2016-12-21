#import "PersonViewModel.h"

@implementation PersonViewModel

// Presentation logic here!

- (instancetype)initWithPerson:(Person *)person {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _person = person;
    
    if (person.salutation.length > 0) {
        _nameText = [NSString stringWithFormat:@"%@ %@", person.salutation, person.name];
    } else {
        _nameText = person.name;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE MMMM d, yyyy"];
    _birthDateText = [dateFormatter stringFromDate:person.birthDate];
    
    return self;
}

@end

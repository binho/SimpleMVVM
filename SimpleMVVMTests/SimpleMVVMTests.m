#import <XCTest/XCTest.h>

#import "Person.h"
#import "PersonViewModel.h"

@interface SimpleMVVMTests : XCTestCase

@property (nonatomic) NSString *salutation;
@property (nonatomic) NSString *fullName;
@property (nonatomic) NSDate *birthDate;

@end

@implementation SimpleMVVMTests

- (void)setUp {
    [super setUp];
    
    self.salutation = @"Mr";
    self.fullName = @"Cleber";
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"]];
    self.birthDate = [dateFormatter dateFromString: @"1986-03-04"];
}

- (void)tearDown {
    self.salutation = nil;
    self.fullName = nil;
    self.birthDate = nil;
    
    [super tearDown];
}

- (void)testInitialization {
    Person *person = [[Person alloc] initWithSalutation:self.salutation name:self.fullName birthDate:self.birthDate];
    PersonViewModel *personViewModel = [[PersonViewModel alloc] initWithPerson:person];
    
    XCTAssertNotNil(personViewModel, @"Person view model should not be nil");
    XCTAssertTrue(personViewModel.person == person, @"The view model person should be equal o person passed in");
}

- (void)testUseSalutationIfAvailable {
    Person *person = [[Person alloc] initWithSalutation:self.salutation name:self.fullName birthDate:self.birthDate];
    PersonViewModel *personViewModel = [[PersonViewModel alloc] initWithPerson:person];
    
    XCTAssertEqualObjects(personViewModel.nameText, @"Mr Cleber");
}

- (void)testShouldNotUseUnavailableSalutation {
    Person *person = [[Person alloc] initWithSalutation:nil name:self.fullName birthDate:self.birthDate];
    PersonViewModel *personViewModel = [[PersonViewModel alloc] initWithPerson:person];
    
    XCTAssertEqualObjects(personViewModel.nameText, @"Cleber");
}

- (void)testShouldUseCorrectDateFormat {
    Person *person = [[Person alloc] initWithSalutation:self.salutation name:self.fullName birthDate:self.birthDate];
    PersonViewModel *personViewModel = [[PersonViewModel alloc] initWithPerson:person];
    
    XCTAssertEqualObjects(personViewModel.birthDateText, @"Tuesday March 4, 1986");
}

@end

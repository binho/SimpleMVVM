#import "ViewController.h"
#import "Person.h"
#import "PersonViewModel.h"

@interface ViewController ()

// UI elements
@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UILabel *birthDateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUIElements];
    [self loadData];
}

- (void)initUIElements {
    self.nameLabel = [UILabel new];
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.textColor = [UIColor redColor];
    self.nameLabel.font = [UIFont systemFontOfSize:16.0f];
    [self.view addSubview:self.nameLabel];
    
    self.birthDateLabel = [UILabel new];
    self.birthDateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.birthDateLabel.textAlignment = NSTextAlignmentCenter;
    self.birthDateLabel.textColor = [UIColor brownColor];
    self.birthDateLabel.font = [UIFont systemFontOfSize:16.0f];
    [self.view addSubview:self.birthDateLabel];
    
    NSDictionary *views = @{@"nameLabel": self.nameLabel, @"birthDateLabel": self.birthDateLabel};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[nameLabel]-10-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[birthDateLabel]-10-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[nameLabel]-[birthDateLabel]" options:0 metrics:nil views:views]];
}

- (void)loadData {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"]];
    NSDate *birthDate = [dateFormatter dateFromString: @"1986-03-04"];
    
    Person *person = [[Person alloc] initWithSalutation:@"Mr" name:@"Cleber" birthDate:birthDate];
    PersonViewModel *personViewModel = [[PersonViewModel alloc] initWithPerson:person];
    
    self.nameLabel.text = personViewModel.nameText;
    self.birthDateLabel.text = personViewModel.birthDateText;
}

@end

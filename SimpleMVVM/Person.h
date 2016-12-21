//
//  Person.h
//  SimpleMVVM
//
//  Created by Cleber Santos on 12/20/16.
//  Copyright © 2016 Cleber Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (instancetype)initWithSalutation:(NSString *)salutation name:(NSString *)name birthDate:(NSDate *)birthDate;

@property (nonatomic, readonly) NSString *salutation;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSDate *birthDate;

@end

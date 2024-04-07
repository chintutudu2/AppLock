//
//  RCTAllAppModule.m
//  AppLock
//
//  Created by Suleman Soren on 31/03/24.
//

#import "RCTAllAppModule.h"
#import <React/RCTLog.h>

@implementation RCTAllAppModule

// To export a module named RCTAllAppModule
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getAllApp:(NSString *)name location:(NSString *)location)
{
 RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}

@end

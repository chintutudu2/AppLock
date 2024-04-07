//
//  RCTAllAppModule.m
//  AppLock
//
//  Created by Suleman Soren on 31/03/24.
//

#import "RCTAllAppModule.h"
#import <React/RCTLog.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation RCTAllAppModule

// To export a module named RCTAllAppModule
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getInstalledApps:(RCTResponseSenderBlock)callback)
{
  NSMutableArray *installedApps = [NSMutableArray array];
  
  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSURL *applicationsDirectory = [NSURL URLWithString:@"/Applications/"];
  NSArray<NSURL *> *appURLs = [fileManager contentsOfDirectoryAtURL:applicationsDirectory includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
  
  for (NSURL *appURL in appURLs) {
      NSString *bundlePath = [appURL.path stringByAppendingPathComponent:@"Info.plist"];
      NSDictionary *infoDictionary = [NSDictionary dictionaryWithContentsOfFile:bundlePath];
      if (infoDictionary) {
          NSString *appName = infoDictionary[@"CFBundleName"];
          NSString *bundleIdentifier = infoDictionary[@"CFBundleIdentifier"];
          
          if (appName && bundleIdentifier) {
              NSDictionary *appInfo = @{@"appName": appName, @"bundleIdentifier": bundleIdentifier};
              [installedApps addObject:appInfo];
          }
      }
  }
  
  NSLog(@"Installed Apps: %@", installedApps);
}

@end

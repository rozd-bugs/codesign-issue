//
//  CodeSignIssueFacade.m
//  CodeSignIssueFacade
//
//  Created by Max Rozdobudko on 9/15/19.
//  Copyright © 2019 Max Rozdobudko. All rights reserved.
//

#import "CodeSignIssueFacade.h"
#import "FlashRuntimeExtensions.h"
#import <CodeSignIssueExtension/CodeSignIssueExtension.h>

@implementation CodeSignIssueFacade

@end

#pragma mark API

FREObject ANXCodeSignIssueIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[]) {
    NSLog(@"ANXCodeSignIssueIsSupported");
    FREObject result;
    FRENewObjectFromBool([CodeSignIssueExtension isSupported], &result);
    return result;
}

#pragma mark ContextInitialize / ContextFinalizer

void ANXCodeSignIssueContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet) {
    NSLog(@"ANXCodeSignIssueContextInitializer");

    *numFunctionsToSet = 1;

    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctionsToSet));

    // functions

    func[0].name = (const uint8_t*) "isSupported";
    func[0].functionData = NULL;
    func[0].function = &ANXCodeSignIssueIsSupported;

    *functionsToSet = func;
}

void ANXCodeSignIssueContextFinalizer(FREContext ctx) {
    NSLog(@"ANXCodeSignIssueContextFinalizer");
}

#pragma mark Initializer / Finalizer

void ANXCodeSignIssueInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) {
    NSLog(@"ANXCodeSignIssueInitializer");

    *extDataToSet = NULL;

    *ctxInitializerToSet = &ANXCodeSignIssueContextInitializer;
    *ctxFinalizerToSet = &ANXCodeSignIssueContextFinalizer;
}

void ANXCodeSignIssueFinalizer(void* extData) {
    NSLog(@"ANXCodeSignIssueFinalizer");
}

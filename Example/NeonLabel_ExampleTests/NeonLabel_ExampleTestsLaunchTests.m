#import <XCTest/XCTest.h>

@interface NeonLabel_ExampleTestsLaunchTests : XCTestCase

@end

@implementation NeonLabel_ExampleTestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

- (void)testNeonLabelTextChangeUpdatesSize {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    
    XCUIElement *label = app.otherElements[@"neonLabel"];
    
    [app/*@START_MENU_TOKEN@*/.staticTexts[@"InitialText"]/*[[".buttons[@\"InitialText\"].staticTexts[@\"InitialText\"]",".staticTexts[@\"InitialText\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    
    CGRect initialFrame = label.frame;
    
    [app/*@START_MENU_TOKEN@*/.staticTexts[@"ChangeText"]/*[[".buttons[@\"ChangeText\"].staticTexts[@\"ChangeText\"]",".buttons[@\"changeText\"].staticTexts[@\"ChangeText\"]",".staticTexts[@\"ChangeText\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    
    CGRect updatedFrame = label.frame;
    
    XCTAssertTrue(initialFrame.size.width < updatedFrame.size.width);
}

- (void)testNeonLabelFontChangeUpdateSize {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    
    XCUIElement *label = app.otherElements[@"neonLabel"];
    
    [app.staticTexts[@"InitialFont"] tap];
    
    CGRect initialFrame = label.frame;
    
    [app.staticTexts[@"ChangeFont"] tap];
    
    CGRect updatedFrame = label.frame;
    
    XCTAssertTrue(initialFrame.size.width < updatedFrame.size.width);
}

@end

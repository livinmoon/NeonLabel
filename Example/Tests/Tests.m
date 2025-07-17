@import XCTest;
#import "ViewController.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNeonLabelTextChangeUpdatesSize {
    ViewController *vc = [[ViewController alloc] init];
    
    NeonLabel *label = vc.neonLabel;
    label.text = @"Short";
    [vc.view layoutIfNeeded];
    
    CGSize shortSize = label.frame.size;
    
    label.text = @"This is a much longer";
    [vc.view layoutIfNeeded];
    
    CGSize longSize = label.frame.size;
    
    XCTAssertTrue(shortSize.width < longSize.width);
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end


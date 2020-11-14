import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(OpenWeatherServiceTests.allTests),
    ]
}
#endif

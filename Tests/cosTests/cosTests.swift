import XCTest
@testable import cos

final class cosTests: XCTestCase {
    
    let authURL = "https://iam.bluemix.net/oidc/token?apikey=0TyIDxgDWBNQqjEChFvjV3fGPpg5HXZ8bFj_14B6Tq3E&response_type=cloud_iam&grant_type=urn:ibm:params:oauth:grant-type:apikey"
    
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

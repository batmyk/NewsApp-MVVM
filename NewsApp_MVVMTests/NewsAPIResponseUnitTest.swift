//
//  NewsAPIResponseUnitTest.swift
//  NewsApp_MVVMTests
//
//  Created by Mayank on 21/02/23.
//

import XCTest
@testable import NewsApp_MVVM

class NewsAPIResponseUnitTest: XCTestCase {
    
    func test_NewsAPIResponse() {
        
        let baseURL = NewsEndPoints.baseURL
        let networkObj = NetworkManager()
        
        let expectation = self.expectation(description: "NewsAPI_Valid_Response")
        
        networkObj.fetchNewsData(baseURL: baseURL) { result in
            
            // ASSERT
            XCTAssertNotNil(result) // Result should not be nil.
            
            switch result {
                case .failure(let error):
                XCTAssertNotNil(error) // In case of error, it should not be nil
                
            case .success(let response):
                XCTAssertNotNil(response) // In case of success, response shouldn't be nil
                XCTAssertEqual(response.status, "ok")
            }
            expectation.fulfill()
            
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

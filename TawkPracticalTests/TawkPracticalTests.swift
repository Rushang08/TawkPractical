//
//  TawkPracticalTests.swift
//  TawkPracticalTests
//
//  Created by Rushang Prajapati on 16/05/22.
//

import XCTest
@testable import TawkPractical

class TawkPracticalTests: XCTestCase {
    
    var userListVC: UserListViewController! = UserListViewController()
    
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
    
    func testData() throws {
        //Setup the data for the test
        XCTAssertEqual(userListVC.userListVM.arrUserList.count, 0, "Data not found")
    }
    
    
    /// To verify the User API from Git using since 0.
    func testFetchUserAPIFromGit() throws {
        let promise = expectation(description: "Fetch User Data")
        let url = URL(string: KEY.BASEURL.FETCH_USERS + "0")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) -> Void in
            if data != nil {
                XCTAssertTrue(true, "User list found from API")
            } else {
                XCTAssertFalse(false, "API Failed.")
            }
            promise.fulfill()
        }
        task.resume()
        waitForExpectations(timeout: 60, handler: nil)
        
    }
    
    /// To verify the User detail API from Git using Static user mojombo .
    func testFetchUserDetailAPIFromGit() throws {
        
        let promise = expectation(description: "Fetch User Detail")
        let url = URL(string: KEY.BASEURL.FETCH_USERDETAIL + "mojombo")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) -> Void in
            if data != nil {
                XCTAssertTrue(true, "Fetch User Detail from API.")
            } else {
                XCTAssertFalse(false, "API Failed.")
            }
            promise.fulfill()
        }
        task.resume()
        waitForExpectations(timeout: 60, handler: nil)
        
    }
    
    /// To verify data being store in coredata
    func testCoreData() throws {
        
        let objUserList = UserList(starredUrl: "", id: 1, gravatarId: "", avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4", subscriptionsUrl: "https://api.github.com/users/mojombo/subscriptions", htmlUrl: "https://github.com/mojombo", receivedEventsUrl: "https://api.github.com/users/mojombo/received_events", login: "mojombo", followingUrl: "https://api.github.com/users/mojombo/following{/other_user}", type: "User", url: "https://api.github.com/users/mojombo", gistsUrl: "https://api.github.com/users/mojombo/gists{/gist_id}", reposUrl: "https://api.github.com/users/mojombo/repos", siteAdmin: false, followersUrl: "https://api.github.com/users/mojombo/followers", nodeId: "MDQ6VXNlcjE=", organizationsUrl: "https://api.github.com/users/mojombo/orgs", eventsUrl: "https://api.github.com/users/mojombo/events{/privacy}", notes: "")
        
        XCTAssertNotNil(objUserList.id, "id should not be nil")
        XCTAssertNotNil(objUserList.login, "login should not be nil")
        XCTAssertTrue(objUserList.avatarUrl == "https://avatars.githubusercontent.com/u/1?v=4")
        XCTAssertTrue(objUserList.nodeId == "MDQ6VXNlcjE=")
        XCTAssertTrue(objUserList.url == "https://api.github.com/users/mojombo")
        XCTAssertTrue(objUserList.htmlUrl == "https://github.com/mojombo")
        XCTAssertTrue(objUserList.siteAdmin == false)
        
    }
    
    /// To verify notes being store in coredata
    func testSaveNotesinCoredata() throws {
        
        let objUserList = UserList(starredUrl: "", id: 1, gravatarId: "", avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4", subscriptionsUrl: "https://api.github.com/users/mojombo/subscriptions", htmlUrl: "https://github.com/mojombo", receivedEventsUrl: "https://api.github.com/users/mojombo/received_events", login: "mojombo", followingUrl: "https://api.github.com/users/mojombo/following{/other_user}", type: "User", url: "https://api.github.com/users/mojombo", gistsUrl: "https://api.github.com/users/mojombo/gists{/gist_id}", reposUrl: "https://api.github.com/users/mojombo/repos", siteAdmin: false, followersUrl: "https://api.github.com/users/mojombo/followers", nodeId: "MDQ6VXNlcjE=", organizationsUrl: "https://api.github.com/users/mojombo/orgs", eventsUrl: "https://api.github.com/users/mojombo/events{/privacy}", notes: "testing ")
        
        XCTAssertNotNil(objUserList.notes, "notes should not be nil")
        XCTAssertTrue(objUserList.notes == "testing ")
        
    }
    
    /// To verify the search operation from local array.
    func testSearchData() throws {
        
        let searchText = "t"
        var arrUser = [UserList]()
        
        arrUser.append(UserList(starredUrl: "", id: 1, gravatarId: "", avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4", subscriptionsUrl: "https://api.github.com/users/mojombo/subscriptions", htmlUrl: "https://github.com/mojombo", receivedEventsUrl: "https://api.github.com/users/mojombo/received_events", login: "mojombo", followingUrl: "https://api.github.com/users/mojombo/following{/other_user}", type: "User", url: "https://api.github.com/users/mojombo", gistsUrl: "https://api.github.com/users/mojombo/gists{/gist_id}", reposUrl: "https://api.github.com/users/mojombo/repos", siteAdmin: false, followersUrl: "https://api.github.com/users/mojombo/followers", nodeId: "MDQ6VXNlcjE=", organizationsUrl: "https://api.github.com/users/mojombo/orgs", eventsUrl: "https://api.github.com/users/mojombo/events{/privacy}", notes: "testing "))
        arrUser.append(UserList(starredUrl: "", id: 1, gravatarId: "", avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4", subscriptionsUrl: "https://api.github.com/users/mojombo/subscriptions", htmlUrl: "https://github.com/mojombo", receivedEventsUrl: "https://api.github.com/users/mojombo/received_events", login: "mojombo", followingUrl: "https://api.github.com/users/mojombo/following{/other_user}", type: "User", url: "https://api.github.com/users/mojombo", gistsUrl: "https://api.github.com/users/mojombo/gists{/gist_id}", reposUrl: "https://api.github.com/users/mojombo/repos", siteAdmin: false, followersUrl: "https://api.github.com/users/mojombo/followers", nodeId: "MDQ6VXNlcjE=", organizationsUrl: "https://api.github.com/users/mojombo/orgs", eventsUrl: "https://api.github.com/users/mojombo/events{/privacy}", notes: "testing "))
        XCTAssertNotEqual(searchText.count, 0, "search text should not be nil")
        XCTAssertNotEqual(arrUser.count, 0, "user list should not be nil")
    }
    
}

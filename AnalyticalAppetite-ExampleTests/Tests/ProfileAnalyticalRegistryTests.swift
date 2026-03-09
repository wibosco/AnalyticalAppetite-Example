//
//  ProfileAnalyticalRegistryTests.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import AnalyticalAppetite_Example

class ProfileAnalyticalRegistryTests: XCTestCase {
    var stub: StubAnalyticsEventSending!
    var sut: ProfileAnalyticalRegistry!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        stub = StubAnalyticsEventSending()
        sut = ProfileAnalyticalRegistry(service: stub)
    }

    // MARK: - Tests

    func test_whenSendAvatarChangedEventIsCalled_thenEventDetailsAreCorrect() {
        sut.sendAvatarChangedEvent()

        guard case let .send(event) = stub.events.first else {
            XCTFail("Expected send event")
            return
        }

        XCTAssertEqual(event.name, "Avatar Changed")
        XCTAssertTrue(event.properties.isEmpty)
    }

    func test_whenSendFieldsChangedEventIsCalled_thenEventDetailsAreCorrect() {
        let firstNameChanged = true
        let lastNameChanged = true
        let emailAddressChanged = false
        let bioChanged = true

        sut.sendFieldsChangedEvent(firstNameChanged: firstNameChanged,
                                   lastNameChanged: lastNameChanged,
                                   emailAddressChanged: emailAddressChanged,
                                   bioChanged: bioChanged)

        guard case let .send(event) = stub.events.first else {
            XCTFail("Expected send event")
            return
        }

        XCTAssertEqual(event.name, "Profile Fields")
        XCTAssertEqual(event.properties["First Name Changed"] as? Bool, firstNameChanged)
        XCTAssertEqual(event.properties["Last Name Changed"] as? Bool, lastNameChanged)
        XCTAssertEqual(event.properties["Email Address Changed"] as? Bool, emailAddressChanged)
        XCTAssertEqual(event.properties["Bio Changed"] as? Bool, bioChanged)
        XCTAssertEqual(event.properties["Total Fields Changed"] as? Int, 3)
    }

    func test_whenSendFriendRequestEventIsCalled_thenEventDetailsAreCorrect() {
        let requested = true

        sut.sendFriendRequestEvent(requested: requested)

        guard case let .send(event) = stub.events.first else {
            XCTFail("Expected send event")
            return
        }

        XCTAssertEqual(event.name, "Friend Request")
        XCTAssertEqual(event.properties["Friend Requested"] as? Bool, requested)
    }
}

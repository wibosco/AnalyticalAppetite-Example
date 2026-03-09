//
//  ProfileAnalyticRegistry.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class ProfileAnalyticalRegistry {
    private let service: AnalyticsEventSending
    
    // MARK: - Init
    
    init(service: AnalyticsEventSending) {
        self.service = service
    }
    
    // MARK: - Events
    
    // MARK: - Avatar
    
    func sendAvatarChangedEvent() {
        let event = AnalyticsEvent(name: "Avatar Changed")
        
        service.send(event)
    }
    
    // MARK: - Fields
    
    func sendFieldsChangedEvent(firstNameChanged: Bool,
                                lastNameChanged: Bool,
                                emailAddressChanged: Bool,
                                bioChanged: Bool) {
        let totalFieldsChanged = [firstNameChanged, lastNameChanged, emailAddressChanged, bioChanged]
            .filter { $0 }
            .count
    
        let properties: [String: Any] = ["First Name Changed": firstNameChanged,
                                         "Last Name Changed": lastNameChanged,
                                         "Email Address Changed": emailAddressChanged,
                                         "Bio Changed": bioChanged,
                                         "Total Fields Changed": totalFieldsChanged]
        
        let event = AnalyticsEvent(name: "Profile Fields",
                                   properties: properties)
        
        service.send(event)
    }
    
    // MARK: - FriendRequest
    
    func sendFriendRequestEvent(requested: Bool) {
        let event = AnalyticsEvent(name: "Friend Request",
                                   properties: ["Friend Requested": requested])
        
        service.send(event)
    }
}

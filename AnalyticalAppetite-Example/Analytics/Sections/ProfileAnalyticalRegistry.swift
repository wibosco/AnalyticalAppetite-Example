//
//  ProfileAnalyticRegistry.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class ProfileAnalyticalRegistry: AnalyticalRegistry {
    
    // MARK: - Events
    
    let avatarChangedEventName = "Avatar Changed"
    let profileFieldsEventName = "Profile Fields"
    let friendRequestEventName = "Friend Request"
    
    // MARK: - Parameters
    
    let fieldsFirstNameChangedPropertyName = "First Name Changed"
    let fieldsLastNameChangedPropertyName = "Last Name Changed"
    let fieldsEmailAddressChangedPropertyName = "Email Address Changed"
    let fieldsBioChangedPropertyName = "Bio Changed"
    let fieldsTotalChangedPropertyName = "Total Fields Changed"
    let friendRequestedPropertyName = "Friend Requested"
    
    // MARK: - Avatar
    
    func sendAvatarChangedEvent() {
        delegate.sendEvent(avatarChangedEventName)
    }
    
    // MARK: - Fields
    
    func sendFieldsChangedEvent(firstNameChanged: Bool, lastNameChanged: Bool, emailAddressChanged: Bool, bioChanged: Bool) {
        
        var properties: [String: AnyObject] = [fieldsFirstNameChangedPropertyName: firstNameChanged,
                                               fieldsLastNameChangedPropertyName: lastNameChanged,
                                               fieldsEmailAddressChangedPropertyName: emailAddressChanged,
                                               fieldsBioChangedPropertyName: bioChanged]
        
        var totalFieldsChanged = 0
        
        if firstNameChanged {
            totalFieldsChanged += 1
        }
        
        if lastNameChanged {
            totalFieldsChanged += 1
        }
        
        if emailAddressChanged {
            totalFieldsChanged += 1
        }
        
        if bioChanged {
            totalFieldsChanged += 1
        }
        
        properties[fieldsTotalChangedPropertyName] = totalFieldsChanged
        
        delegate.sendEvent(profileFieldsEventName, properties: properties)
    }
    
    // MARK: - FriendRequest
    
    func sendFriendRequest(requested: Bool) {
        let properties = [friendRequestedPropertyName: requested]
        
        delegate.sendEvent(friendRequestEventName, properties: properties)
    }
}

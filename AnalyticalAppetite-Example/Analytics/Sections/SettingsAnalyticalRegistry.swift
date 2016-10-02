//
//  SettingsAnalyticalRegistry.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class SettingsAnalyticalRegistry: NSObject {
    
    // MARK: Events
    
    let notificationsEventName = "Notifications"
    
    // MARK: Parameters
    
    let notificationsEnabledPropertyName = "Notification Enabled"
    
    // MARK: Singleton
    
    static let sharedInstance = ProfileAnalyticalRegistry()
    
    // MARK: Properties
    
    var delegate: AnalyticsDelegate?
    
    // MARK: Notification
    
    func sendNotificationEnabled(enabled: Bool) {
        let properties = [notificationsEnabledPropertyName: enabled]
        
        delegate?.sendEvent(notificationsEventName, properties: properties)
    }
}

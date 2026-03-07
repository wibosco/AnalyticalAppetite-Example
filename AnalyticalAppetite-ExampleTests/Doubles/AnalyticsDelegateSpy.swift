//
//  AnalyticsDelegateSpy.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class AnalyticsDelegateSpy: NSObject, AnalyticsDelegate {
    
    // MARK: Properties
    
    var passedInEventName: String?
    var passedInProperties: [String: Any]?
    
    // MARK: - AnalyticsDelegate
    
    func sendEvent(name: String) {
        passedInEventName = name
    }
    
    func sendEvent(name: String,
                   properties: [String: Any]?) {
        passedInEventName = name
        passedInProperties = properties
    }
    
    func startTimedEvent(name: String) {
        passedInEventName = name
    }
}

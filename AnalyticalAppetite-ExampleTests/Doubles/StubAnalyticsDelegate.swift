//
//  AnalyticsDelegateSpy.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class StubAnalyticsDelegate: AnalyticsDelegate {
    enum Event {
        case sendEvent(String, [String: Any]?)
        case startTimedEvent(String)
    }
    
    private(set) var events = [Event]()
    
    func sendEvent(name: String,
                   properties: [String: Any]?) {
        events.append(.sendEvent(name, properties))
    }
    
    func startTimedEvent(name: String) {
        events.append(.startTimedEvent(name))
    }
}

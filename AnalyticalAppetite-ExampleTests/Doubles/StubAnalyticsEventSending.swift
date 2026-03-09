//
//  StubAnalyticsEventSending.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

@testable import AnalyticalAppetite_Example

class StubAnalyticsEventSending: AnalyticsEventSending {
    enum Event {
        case send(AnalyticsEvent)
    }
    
    private(set) var events = [Event]()
    
    func send(_ event: AnalyticsEvent) {
        events.append(.send(event))
    }
}

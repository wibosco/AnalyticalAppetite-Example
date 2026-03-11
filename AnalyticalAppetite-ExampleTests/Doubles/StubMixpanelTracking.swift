//
//  StubMixpanelTracking.swift
//  AnalyticalAppetite-ExampleTests
//
//  Created by William Boles on 11/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

@testable import AnalyticalAppetite_Example

class StubMixpanelTracking: MixpanelTracking {
    enum Event {
        case track(String, [AnyHashable : Any]?)
    }
    
    private(set) var events = [Event]()
    
    func track(_ event: String,
               properties: [AnyHashable : Any]?) {
        events.append(.track(event, properties))
    }
}

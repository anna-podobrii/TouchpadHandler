//
//  TouchpadHandlerApp.swift
//  TouchpadHandler
//
//  Created by Anna Podobrii on 16.05.2023.
//

import SwiftUI

@main
struct TouchpadHandlerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(touchpadHandlerProtocol: TouchpadController())
        }
    }
}

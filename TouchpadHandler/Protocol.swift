//
//  Protocol.swift
//  TouchpadHandler
//
//  Created by Anna Podobrii on 16.05.2023.
//

import Foundation

protocol TouchpadHandlerProtocol {
    func onButtonEvent(isPressed: Bool)
    func onTouchEvent(
        idx: Int, // finger index
        x: Double, // coordinate in percentage of width (0…100)
        y: Double // coordinate in percentage of height (0…100)
    ) 
}

struct TouchpadController: TouchpadHandlerProtocol {

    func onTouchEvent(idx: Int, x: Double, y: Double) {
        print("Index:\(idx), x: \(Int(x))%, y: \(Int(y))%")
    }
    
    func onButtonEvent(isPressed: Bool) {
        print("Button tapped: \(isPressed)")
    }

}

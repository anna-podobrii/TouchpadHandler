//
//  ContentView.swift
//  TouchpadHandler
//
//  Created by Anna Podobrii on 16.05.2023.
//

import SwiftUI
import UIKit

struct Location {
  let id: Int
  let x: Double
  let y: Double
}

struct ContentView: View {
    let touchpadHandlerProtocol: TouchpadHandlerProtocol
    @State private var showButtons = true
    @GestureState private var isTappedButton = false
    @State private var tappedLocation = false
    var constantForWidth: CGFloat = 300
    var constantForHeight: CGFloat = 300
    var heightWithButton: CGFloat {
        return constantForHeight * 0.66
    }
    @State var points:[CGPoint] = []
    
    var body: some View {
        let tap = DragGesture(minimumDistance: 0)
            .updating($isTappedButton) { (_, isTapped, _) in
                isTapped = true
            }
        
        let tapLocation = DragGesture(minimumDistance: 0)
            .onEnded{ location in
                points.append(location.startLocation)
                tappedLocation.toggle()
            }

        VStack {

            Toggle("Show Button", isOn: $showButtons)
                .padding(.bottom, 30.0)

            ZStack(alignment: .bottom){
                RoundedRectangle(cornerRadius: 15.0)
                    .strokeBorder(Color.black, lineWidth: 3.0)
                    .background(Color.white)
                    .frame(width: constantForWidth, height: constantForHeight)
                    .gesture(tapLocation)
                    .onChange(of: tappedLocation) { new in touchpadHandlerProtocol.onTouchEvent(idx: points.count, x: (points.last?.x ?? 0) * 100/constantForWidth, y: showButtons ? (points.last?.y ?? 0) * 100/heightWithButton : (points.last?.y ?? 0) * 100/constantForHeight)}
                
                if showButtons {
                    Rectangle()
                        .strokeBorder(Color.black, lineWidth: 3.0)
                        .frame(width: constantForWidth, height: constantForHeight/3)
                        .background(Color.white)
                        .gesture(tap)
                        .onChange(of: isTappedButton) { newValue in
                            touchpadHandlerProtocol.onButtonEvent(isPressed: isTappedButton)}
                    if isTappedButton {
                        Rectangle()
                            .strokeBorder(Color.black, lineWidth: 3.0)
                            .frame(width: constantForWidth, height: constantForHeight/3)
                            .background(Color.white)
                    }
                }
                RoundedRectangle(cornerRadius: 15.0)
                    .strokeBorder(Color.black, lineWidth: 3.0)
                    .frame(width: constantForWidth, height: constantForHeight)
            }
            .cornerRadius(15.0)
            Text(isTappedButton ? "Button tapped: true" : "Button tapped: false")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(touchpadHandlerProtocol: TouchpadController())
    }
}

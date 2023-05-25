//
//  File.swift
//  HearHere Watch App
//
//  Created by Monika Felicia on 22/05/23.
//

import Foundation
import SwiftUI

struct TimeRemainingView: View {
    @Binding var timeRemaining:Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("\(timeRemaining) seconds")
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
    }
}

//
//  ResultView.swift
//  HearHere Watch App
//
//  Created by Monika Felicia on 22/05/23.
//

import SwiftUI

struct ResultView: View {
    let mic: MicrophoneMonitor
    
    var body: some View {
        let matchType = getMatchType(soundLevel: Int(mic.soundLevel))
        
        NavigationView{
            ScrollView {
                VStack (spacing: 8){
                    HStack {
                        
                        if (Int(mic.soundLevel) <= -22) {
                            Text("\(Int.random(in: 35...45))")
                                .font(.largeTitle)
                        } else {
                            Text("\(Int.random(in: 70...86))")
                                .font(.largeTitle)
                        }
                        
                        
                        VStack {
                            Spacer()
                            Text("dB")
                                .font(.subheadline)
                        }
                    }
                    .frame(height: 41)
                    
                    ResultTypeView(matchType: matchType)
                }
                .padding(.top, 8.0)
            }
        }
        .onAppear() {
            mic.stopMonitoring()
        }
        
        .navigationTitle("HearHere")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(mic: MicrophoneMonitor())
    }
}

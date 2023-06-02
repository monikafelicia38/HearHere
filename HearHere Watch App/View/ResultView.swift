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
        
        //MARK: Result Information
        NavigationView{
            ScrollView {
                VStack (spacing: 8){
                    HStack {
                        
                        //MARK: Decibel Label based on the Condition of dBFS
                        if (Int(mic.soundLevel) <= -22) {
                            Text("\(Int.random(in: 35...45))")
                                .font(.largeTitle)
                        } else {
                            Text("\(Int.random(in: 70...86))")
                                .font(.largeTitle)
                        }
                        
                        //MARK: dB Label
                        VStack {
                            Spacer()
                            Text("dB")
                                .font(.subheadline)
                        }
                    }
                    .frame(height: 41)
                    
                    //MARK: Information based on Result
                    ResultTypeView(matchType: matchType)
                }
                .padding(.top, 8.0)
            }
        }
        
        //MARK: Stop Monitor the Microphone
        .onAppear() {
            mic.stopMonitoring()
        }
        
        //MARK: App Name inline
        .navigationTitle("HearHere")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(mic: MicrophoneMonitor())
    }
}

//
//  DetectView.swift
//  HearHere Watch App
//
//  Created by Monika Felicia on 21/05/23.
//

import SwiftUI

struct DetectView: View {
    
    @ObservedObject var mic = MicrophoneMonitor()
    @State var timeRemaining = 10
    @State var scaleUp = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        //MARK: Link to the Next Page
        NavigationStack {
            ZStack {
                NavigationLink(
                    destination: ResultView(mic: mic),
                    isActive: .constant(timeRemaining == 0)) {
                        EmptyView()
                    }
                    .opacity(0)
                
                //MARK: Animation Circle
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color("Oval1"))
                            .frame(width: 100, height: 100)
                            .scaleEffect(scaleUp ? 1 : randomScale())
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true), value: scaleUp)
                        
                        Circle()
                            .fill(Color("Purple"))
                            .frame(width: 76, height: 76)
                            .scaleEffect(scaleUp ? 1 : randomScale())
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true), value: scaleUp)
                        
                        Circle()
                            .fill(Color("Oval3"))
                            .frame(width: 60, height: 60)
                            }
                    
                    //MARK: Prompt to Wait
                    Text("Wait for it...")
                        .padding(.top, 8.0)
                    
                    //MARK: Countdown Timer
                    Text("\(timeRemaining) seconds")
                        .onReceive(timer) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                                scaleUp.toggle()
                            }
                        }
                        .foregroundColor(Color("Grey"))
                    
                    //MARK: Check the soundLevel in dBFS (Decibel Full Scale)
                    //Text("\(mic.soundLevel)")
                }
            }
            .padding(.top, 20.0)
            
        }
        //MARK: Start Monitor the Microphone
        .onAppear() {
            self.mic.startMonitoring()
        }
        
        //MARK: App Name inline
        .navigationTitle("HearHere")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    //MARK: Randoming the Decibel based on the observasion
    func randomScale() -> Double {
        return [1.05, 1.1, 1.2].randomElement()!
    }
}

struct DetectView_Previews: PreviewProvider {
    static var previews: some View {
        DetectView()
    }
}

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
    
    @State var startAnimation: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                NavigationLink(
                    destination: ResultView(mic: mic),
                    isActive: .constant(timeRemaining == 0)) {
                        EmptyView()
                    }
                    .opacity(0)
                
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color("Oval1"))
                            .frame(width: 100, height: 100)
                            .scaleEffect(scaleUp ? 1 : randomScale())
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true), value: scaleUp)
//                            .onReceive (timer) { t in
//                                if self.timeRemaining <= 10 {
//                                    withAnimation(.easeIn(duration: 20)) {
//                                        startAnimation.toggle()
//                                    }
//                                }
//                            }
                        
                        Circle()
                            .fill(Color("Purple"))
                            .frame(width: 76, height: 76)
                            .scaleEffect(scaleUp ? 1 : randomScale())
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true), value: scaleUp)
//                            .onReceive (timer) { t in
//                                if self.timeRemaining <= 10 {
//                                    withAnimation(.easeIn(duration: 20)) {
//                                        startAnimation.toggle()
//                                    }
//                                }
//                            }
//                            .animation(.easeIn)
                        
                        Circle()
                            .fill(Color("Oval3"))
                            .frame(width: 60, height: 60)
                                
                            }
                    Text("Wait for it...")
                        .padding(.top, 8.0)
                    
                    Text("\(timeRemaining) seconds")
                        .onReceive(timer) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                                scaleUp.toggle()
                            }
                        }
                        .foregroundColor(Color("Grey"))
                    //                                            .padding(.top, 16.0)
                    
                    //                    Text("\(mic.soundLevel)")
                }
            }
            .padding(.top, 20.0)
            
        }
        .onAppear() {
            self.mic.startMonitoring()
        }
        .navigationTitle("HearHere")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func randomScale() -> Double {
        return [1.05, 1.1, 1.2].randomElement()!
    }
}

struct DetectView_Previews: PreviewProvider {
    static var previews: some View {
        DetectView()
    }
}

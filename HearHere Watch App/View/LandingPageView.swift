//
//  LandingPageView.swift
//  HearHere Watch App
//
//  Created by Monika Felicia on 22/05/23.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        NavigationView{
            VStack (spacing: 12){
                Image("Logo")
                    .resizable()
                    .frame(width: 90, height: 90)
                
                NavigationLink (destination: DetectView()) {
                    Text("Check")
                        .font(.body)
                        .fontWeight(.medium)
                        .padding(.vertical, 13)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 0)
                                .background(Color("Purple").cornerRadius(20))
                                .frame(width:174, height: 44)
                        )
                }
                
                .cornerRadius(20)
                .frame(width: 174, height: 44)
            }
            
            .padding(.top, 16.0)
            .navigationTitle("HearHere")
            //            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}

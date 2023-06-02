//
//  MismatchedResultView.swift
//  HearHere Watch App
//
//  Created by Monika Felicia on 22/05/23.
//

import SwiftUI

struct ResultTypeView: View {
    var matchType: MatchType
    
    var body: some View {
        
        //MARK: Result Symbol & Title
        ScrollView {
            VStack (spacing: 8){
                VStack(alignment: .leading, spacing: 1.5) {
                    HStack {
                        Image(systemName: matchType.symbol)
                            .foregroundColor(Color.black)
                        Text(matchType.title)
                            .font(.system(size: 17))
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                    }
                    
                    //MARK: Result Description
                    Text(matchType.description)
                        .fontWeight(.medium)
                        .font(.system(size: 14))
                        .foregroundColor(Color.black)
                }
                //MARK: Result Background Color
                .padding(.horizontal, 8.0)
                .padding(.vertical, 12.0)
                .frame(width: 168)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 0)
                        .background(getMatchColor(Match: matchType))
                        .cornerRadius(12)
                )
            }
            .padding(.top, 8.0)
        }
    }
}

struct ResultTypeView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTypeView(matchType: .match)
    }
}

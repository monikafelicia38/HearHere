//
//  MatchType.swift
//  HearHere Watch App
//
//  Created by Monika Felicia on 22/05/23.
//

import SwiftUI

enum MatchType: String {
    case match = "Perfect!"
    case mismatched = "Mismatched!"
    
    var title: String {
        return self.rawValue
    }
    
    var description: String {
        switch self {
        case .match:
            return "This place is conducive to cognitive performance and information processing, especially for complex tasks that require attention and working memory."
        case .mismatched:
            return "This place have some noise distractions that can make a significant impact on your working performance."
        }
    }
    
    var symbol: String {
        switch self {
        case .match:
            return "checkmark.circle.fill"
        case .mismatched:
            return "exclamationmark.triangle.fill"
        }
    }
}

func getMatchColor(Match: MatchType) -> Color {
    switch Match {
    case .match:
        return Color("Green")
    case .mismatched:
        return Color("Red")
    }
}

func getMatchType(soundLevel: Int) -> MatchType {
    if (soundLevel <= -22 ) {
        return .match
    } else {
        return .mismatched
    }
}

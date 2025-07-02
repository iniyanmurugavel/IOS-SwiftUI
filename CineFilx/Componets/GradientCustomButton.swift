//
//  GradientCustomButton.swift
//  CineFilx
//
//  Created by adithyan na on 13/6/25.
//

import Foundation
import SwiftUI

struct GradientButtonStyle : ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.horizontal,30)
            .padding(.vertical)
            .background(
                configuration.isPressed ?
                LinearGradient(colors: [.gray], startPoint: .top, endPoint: .bottom)
                :
                    
                LinearGradient(colors: [.redTheme], startPoint: .top, endPoint: .bottom)
           )
            .cornerRadius(10)
            
              
       
    }
    
}


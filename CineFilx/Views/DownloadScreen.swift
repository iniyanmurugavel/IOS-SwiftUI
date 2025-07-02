//
//  DownloadScreen.swift
//  CineFilx
//
//  Created by adithyan na on 2/7/25.
//

import SwiftUI

struct DownloadScreen: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack{
                Image(systemName: "arrow.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(20)
                
                Text("Downloads")
                    .font(.footnote)
                
                
                
            }
            .font(.title3)
            .foregroundColor(.white)
        }
        
    }
        
      
}

#Preview {
    DownloadScreen()
}

//
//  horiztonalListView.swift
//  CineFilx
//
//  Created by adithyan na on 13/6/25.
//

import SwiftUI

struct horiztonalListView: View {
    var header: String?
    var titles = [Constants.testUrl1, Constants.testUrl2, Constants.testUrl3]
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(header ?? "")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 10){
                    ForEach(titles, id: \.self) { title in
                        AsyncImage(url: URL(string: title)){image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10, ))
                                
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 200)
                    
                        
                    }
                }
            }
            
        }
        .frame(height: 250)
        .padding(10)
        
    }
    
}

#Preview {
    horiztonalListView(header: Constants.lblHeaderTrendingMovies,titles : [Constants.testUrl1, Constants.testUrl2, Constants.testUrl3])
}

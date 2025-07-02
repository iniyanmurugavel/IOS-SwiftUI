//
//  HomeView.swift
//  CineFilx
//
//  Created by adithyan na on 13/6/25.
//

import SwiftUI

struct HomeView: View {
    
     //Variables
    var testImage = "https://image.tmdb.org/t/p/w500/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg"
    var body: some View {
       
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                LazyVStack{
                    AsyncImage(url: URL(string: Constants.matrixImageMovie)){ image in
                        image
                            .resizable()
                            
                            .scaledToFit()
                            
                            .overlay {
                                LinearGradient(stops: [Gradient.Stop(color: .clear, location: 0.8), Gradient.Stop(color: .white, location: 1)], startPoint: .top, endPoint: .bottom)
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geo.size.width,height: geo.size.height * 0.85)
                    .cornerRadius(20)
                    
                    HStack{
                        Button{
                            
                        } label:{
                            Text("Play")
                                .font(.custom("MyFont-Regular", size: 18))
                                .fontWeight(.bold)
                                .cornerRadius(60)
                                .foregroundStyle(.white)
                                .frame(width: 100, height: 20)
                        }
                        .buttonStyle(GradientButtonStyle())
                        .cornerRadius(20)
                        
                        Button{
                            
                        } label:{
                            Text("Download")
                                .font(.custom("MyFont-Regular", size: 18))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .frame(width: 100, height: 20)
                        }
                        .buttonStyle(GradientButtonStyle())
                        .cornerRadius(20)
                        
                        
                    }//hstack button
                //   Spacer()
                    
                    horiztonalListView(header: Constants.lblHeaderTrendingMovies, titles: [Constants.testUrl1,Constants.ironHeart , Constants.testUrl3,Constants.oppenheimer,Constants.matrixImageMovie , Constants.carImage])
                    
                    horiztonalListView(header: Constants.lblHeaderTopRatedMovies, titles: [Constants.oppenheimer,Constants.matrixImageMovie , Constants.carImage,Constants.testUrl1,Constants.ironHeart , Constants.testUrl3,Constants.oppenheimer,Constants.matrixImageMovie , Constants.carImage])
                    
                    horiztonalListView(header: Constants.lblHeaderTrendingTv, titles: [Constants.mobLand,Constants.revial , Constants.ironHeart])
                    
                   // horiztonalListView(header: Constants.lblHeaderTopRatedTv)
                }
            }
        }.background(Color.black) // Set your full background color
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}

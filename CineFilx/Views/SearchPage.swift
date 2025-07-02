//
//  SearchPage.swift
//  CineFilx
//
//  Created by adithyan na on 2/7/25.
//

import SwiftUI

struct SearchScreenView: View {
    @State private var searchText = ""
    
    let allMovies = [
        Movie(title: "Inception", posterName: Constants.matrixImageMovie, genre: "Sci-Fi"),
        Movie(title: "Interstellar", posterName: Constants.intestellar, genre: "Adventure"),
        Movie(title: "Iron heart", posterName: Constants.ironHeart, genre: "Action"),
        Movie(title: "Cars", posterName: Constants.carImage, genre: "Animation"),
        Movie(title: "Oppenheimer", posterName: Constants.oppenheimer, genre: "Thriller")
    ]
    
    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return allMovies
        } else {
            return allMovies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
         NavigationView {
             VStack(spacing: 0) {
                 // Search Field
                 TextField("", text: $searchText, prompt: Text("Search Movies...")
                     .foregroundColor(.gray) // Placeholder color
                 )
                 .padding(12)
                 .background(Color(.systemGray6))
                 .cornerRadius(10)
                 .padding(.horizontal)
                 .foregroundColor(.black) // Text color when typing

                     
                 // Movie List
                 List {
                     ForEach(filteredMovies) { movie in
                         HStack(spacing: 12) {
                             AsyncImage(url: URL(string: movie.posterName)) { phase in
                                 switch phase {
                                 case .empty:
                                     ProgressView()
                                         .frame(width: 80, height: 120)
                                 case .success(let image):
                                     image
                                         .resizable()
                                         .scaledToFill()
                                         .frame(width: 80, height: 120)
                                         .clipped()
                                         .cornerRadius(8)
                                 case .failure:
                                     Image(systemName: "film")
                                         .resizable()
                                         .scaledToFit()
                                         .frame(width: 80, height: 120)
                                         .foregroundColor(.gray)
                                 @unknown default:
                                     EmptyView()
                                 }
                             }

                             VStack(alignment: .leading, spacing: 4) {
                                 Text(movie.title)
                                     .font(.headline)
                                     .foregroundColor(.white)

                                 Text(movie.genre)
                                     .font(.subheadline)
                                     .foregroundColor(.gray)
                             }
                         }
                         .listRowBackground(Color.black) // Make row background black
                     }
                 }
                 .listStyle(PlainListStyle())
             }
             .background(Color.black.ignoresSafeArea()) // Full screen black background
             .navigationTitle("Search")
             .foregroundColor(.white)
         }
         .navigationViewStyle(StackNavigationViewStyle())
         .onAppear {
             let navBar = UINavigationBarAppearance()
             navBar.configureWithOpaqueBackground()
             navBar.backgroundColor = .black
             navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
             navBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

             UINavigationBar.appearance().standardAppearance = navBar
             UINavigationBar.appearance().scrollEdgeAppearance = navBar
         }
     }
 }


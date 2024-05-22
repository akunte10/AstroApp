//
//  DetailsPage.swift
//  AstroApp
//
//  Created by Ajay Kunte on 22/05/24.
//

import SwiftUI

struct DetailsPage: View {
    @State var title: String
    @State var image: String
    @State var description: String
    
    init(title: String, image: String, description: String) {
        self.title = title
        self.image = image
        self.description = description
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    // Title
                    Text(title)
                        .font(.title)
                        .padding(.leading, 20)
                    Spacer()
                }
                .padding(.top, 20)

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            AsyncImage(url: URL(string: image)) { phase in
                                if let image = phase.image {
                                    // Display the loaded image
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .mask(RoundedRectangle(cornerRadius: 16))
                                } else if phase.error != nil {
                                    // Display a placeholder when loading failed
                                    Image(systemName: "questionmark.diamond")
                                        .imageScale(.large)
                                } else {
                                    // Display a placeholder while loading
                                    HStack {
                                        Spacer()
                                        ProgressView()
                                            .padding(.vertical, 20)
                                        Spacer()
                                    }
                                }
                            }
                            Spacer()
                        }
                        
                        // Explanation
                        Text(description)
                            .font(.subheadline)
                    }
                }
                .padding(.horizontal, 20)
                Spacer()
            }
        }
    }
}

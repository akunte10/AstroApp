//
//  ListCellView.swift
//  AstroApp
//
//  Created by Ajay Kunte on 22/05/24.
//

import SwiftUI

struct ListCellView: View {
    @State var title: String
    @State var imageUrl: String
    @State var capturedDate: String
    var onSelect: () -> Void
    
    init(title: String, imageUrl: String, capturedDate: String, onSelect: @escaping () -> Void) {
        self.title = title
        self.imageUrl = imageUrl
        self.capturedDate = capturedDate
        self.onSelect = onSelect
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // AsyncImage
                AsyncImage(url: URL(string: imageUrl)) { phase in
                    if let image = phase.image {
                        // Display the loaded image
                        image
                            .resizable()
                            .frame(width: 70, height: 70)
                            .aspectRatio(contentMode: .fit)
                            .mask(RoundedRectangle(cornerRadius: 16))
                    } else if phase.error != nil {
                        // Display a placeholder when loading failed
                        Image(systemName: "questionmark.diamond")
                            .frame(width: 50, height: 50)
                            .imageScale(.large)
                            .mask(RoundedRectangle(cornerRadius: 16))
                    } else {
                        // Display a placeholder while loading
                        ProgressView()
                            .padding(.trailing, 20)
                    }
                }
                
                // Title
                Text(title)
                    .font(.title3)
                    .padding(.trailing, 20)
                Spacer()
            }
            
            // Captured date
            Text("\(ScreenConstants.capturedTitle): \(capturedDate)")
                .font(.subheadline)
        }
        .onTapGesture {
            // On tap action
            self.onSelect()
        }
        .padding(.all, 20)
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(title: "", imageUrl: "", capturedDate: "", onSelect: {})
    }
}

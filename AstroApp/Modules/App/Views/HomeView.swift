//
//  HomeView.swift
//  AstroApp
//
//  Created by Ajay Kunte on 22/05/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter = AppPresenter()
    @State var showDetailsPage: Bool = false
    @State var selectedData: NasaDataModelElement?
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    // Title
                    Text(ScreenConstants.homeTitle)
                        .font(.title)
                        .padding([.leading, .top], 20)
                    
                    Divider().frame(height: 10).foregroundColor(.black)
                   
                    if presenter.nasaData.count > 0 {
                        astronomyDataListView
                    } else {
                        if presenter.loading {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    ProgressView().scaleEffect(2.5).tint(.purple)
                                    Spacer()
                                }
                                Spacer()
                            }
                        }
                    }
                }
                // Navigate to the Details Page
                NavigationLink("", isActive: $showDetailsPage, destination: {
                    if let selectedData = selectedData {
                        AppRouter().navigateToDetailsPage(selectedData)
                    }
                })
                .onAppear {
                    // Fetch NASA Astronomy data
                    presenter.fetchAstronomyData()
                }
                .padding(.top, 50)
            }
        }
    }
    
    /// Make UI for Astronomy data list
    @ViewBuilder var astronomyDataListView: some View {
        ScrollView (showsIndicators: false) {
            ForEach(presenter.nasaData.indices, id: \.self) { index in
                let data = presenter.nasaData[index]
                ListCellView(title: data.title ?? "", imageUrl: data.url ?? "", capturedDate: data.date ?? "") {
                    // Navigate to details screen
                    selectedData = data
                    showDetailsPage = true
                }
                if index < presenter.nasaData.count - 1 {
                    Divider()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  AppPresenter.swift
//  AstroApp
//
//  Created by Ajay Kunte on 22/05/24.
//

import Foundation

class AppPresenter: ObservableObject {
    private let networkManger: NetworkManager = NetworkManager()
    
    // Published properties
    @Published var nasaData: NasaDataModel = NasaDataModel()
    @Published var loading = false
    
    /// Fetch Astronomy data
    /// - Parameter url: url string
    func fetchAstronomyData() {
        DispatchQueue.main.async {
            self.loading = true
        }
        guard let url = URL(string: NetworkConstants.baseUrl) else { return }
        networkManger.fetchData(from: url, as: NasaDataModel.self) { [weak self] result in
            DispatchQueue.main.async {
              self?.didFinishAPI(result)
            }
        }
    }
    
    /// Method call when fetch data api is finished
    /// - Parameter result: Result<NasaDataModel, Error>
    func didFinishAPI(_ result: Result<NasaDataModel, Error>) {
        switch result {
        case .success(let data):
            self.nasaData = fetchLastSevenDaysData(from: data)
        case .failure(let error):
            print(error)
        }
        DispatchQueue.main.async {
            self.loading = false
        }
    }
    
    /// Fetch last 7 days data
    /// - Parameter data: Response data
    /// - Returns: Last 7 days data
    func fetchLastSevenDaysData(from data: NasaDataModel) -> NasaDataModel {
        let filteredData = data.filter({
            isWithinLastSevenDays(selectedDate: ($0.date ?? "").toDate(.isoDate) ?? Date())
        })
        return filteredData
    }
    
    /// Check if selected date is within last 7 days
    /// - Parameter selectedDate: Selected Date
    /// - Returns: Returns true if the date is with in last 7 days
    func isWithinLastSevenDays(selectedDate: Date) -> Bool {
        let calendar = Calendar.current
        let sevenDaysAgo = calendar.date(byAdding: .day, value: -7, to: selectedDate) ?? Date()
        return selectedDate >= sevenDaysAgo
    }
}

//
//  AppInteractor.swift
//  AstroApp
//
//  Created by Ajay Kunte on 22/05/24.
//

import Foundation

protocol AppInteractorProtocol {
    func fetchAstronomyData(from url: String)
    func didFinishAPI(_: Result<NasaDataModel, Error>)
}

class AppInteractor: AppInteractorProtocol {
    var presenter: AppPresenter?
    
    /// Fetch Astronomy data
    /// - Parameter url: url string
    func fetchAstronomyData(from url: String) {
        guard let url = URL(string: url) else { return }
        NetworkManager().fetchData(from: url, as: NasaDataModel.self) { [weak self] result in
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
            self.presenter?.nasaData = data
        case .failure(let error):
            print(error)
        }
        DispatchQueue.main.async {
            self.presenter?.loading = false
        }
    }
}

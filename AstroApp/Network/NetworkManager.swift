//
//  NetworkManager.swift
//  AstroApp
//
//  Created by Ajay Kunte on 22/05/24.
//

import Foundation

class NetworkManager {
    /// Fetch given url data
    /// - Parameters:
    ///   - url: Url as string
    ///   - type: Type of Data Model
    /// - Returns: Returns the dynamic response for generic model
    func fetchData<T: Codable>(from url: URL, as type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

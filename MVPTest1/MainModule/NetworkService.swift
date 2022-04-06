//
//  NetworkService.swift
//  MVPTest1
//
//  Created by Vladislav Barinov on 01.04.2022.
//

import Foundation

protocol NetworkServiceProtocol {

    func getComments(_ complition: @escaping (Result<[Comment]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {

    func getComments(_ complition: @escaping (Result<[Comment]?, Error>) -> Void) {

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                complition(.failure(error))
                return
            }
            do {
                let comments = try JSONDecoder().decode([Comment].self, from: data!)
                complition(.success(comments))
            } catch {
                complition(.failure(error))
            }
        }
        task.resume()
    }
}

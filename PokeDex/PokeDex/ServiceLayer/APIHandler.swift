//
//  APIHandler.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import Foundation

enum RequestTypes: String {
    case GET
    case POST
    case DELETE
}

enum NetworkError: Error {
    case invalidURL
    case internalError
    case parsingError
    case invalidData
}

protocol APIHandlerType {
    func request<T: Codable>(endpoint: String,
                             header: RequestTypes,
                             model: T.Type,
                             completion: @escaping((Result<T, NetworkError>)-> Void)
    )
}

class APIHandler: APIHandlerType {
    func request<T: Codable>(endpoint: String,
                             header: RequestTypes,
                             model: T.Type,
                             completion: @escaping(Result<T, NetworkError>) -> Void)
    {
        guard let url = URL(string: endpoint) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = header.rawValue
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        
        let urlSession = URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard error == nil else {
                completion(.failure(NetworkError.internalError))
                return
            }
            
            guard let data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(object))
                }
            }
            
            catch {
                completion(.failure(NetworkError.parsingError))
            }
        }
        urlSession.resume()
    }
}

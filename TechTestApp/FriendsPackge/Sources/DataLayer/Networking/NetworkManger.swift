//
//  NetworkManager.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

// Network manager
public final class NetworkManger: NetworkManagerProtocol {

    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func request<T: Codable>(_ type: T.Type, endPoint: URL) -> Response<T> {
        return Promise { seal in
            let request = URLRequest(url: endPoint)
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    seal.reject(error)
                } else {
                    do {
                        if let dataRecieved = data {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let decodedObject = try decoder.decode(type, from: dataRecieved)
                            seal.fulfill(decodedObject)
                        }
                    } catch {
                        print(error.localizedDescription)
                        seal.reject(error)
                    }
                }
            }
            task.resume()
        }
    }
}


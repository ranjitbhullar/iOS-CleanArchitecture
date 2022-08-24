//
//  NetworkManagerProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

public typealias Response<T> = Promise<T>


public protocol NetworkManagerProtocol {
    func request<T: Codable>(_ type: T.Type, endPoint: URL) -> Response<T>
}

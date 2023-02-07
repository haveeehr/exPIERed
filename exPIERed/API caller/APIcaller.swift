//
//  API caller.swift
//  exPIERed
//
//  Created by Gianluca Annina on 19/01/23.
//

import Foundation

// MARK: - QueryExecuter

public struct QueryExecuter {
    // MARK: Public

    public func get<T: Codable>(table _: String, urlTmp: String) async throws -> T {
        let data = try await buildRequest(urlTmp: urlTmp)

        do {
            let fetchedData = try JSONDecoder().decode(T.self, from: data)
            return fetchedData
        }
        catch {
            throw error
        }
    }

    // MARK: Internal

    static var shared = QueryExecuter()

    /// Build and execute an HTTPRequest fetching all the data
    /// - Parameters:
    ///   - urlTmp: The final url
    ///   - method: The type of the HTTPMethod
    /// - Returns: returns the data fetched from the HTTP request
    func buildRequest(urlTmp: String) async throws -> Data {
        guard let url = URL(string: urlTmp) else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: URL(string: urlTmp)!)

        request.url = url

        request.httpMethod = "GET"

        //        Execution of the API call
        let (data, response) = try await URLSession.shared.data(for: request)
        //        Checking for an error

        if (response as? HTTPURLResponse)?.statusCode ?? 500 < 300 {
        }
        else {
            throw HTTPErrors.httpError
        }

        return data
    }
}

// MARK: - HTTPErrors

/// Enumeration of all the possible HTTP method of the FMOData protocol
public enum HTTPErrors: Error {
    case httpError
}

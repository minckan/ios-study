//
//  NetworkLayer.swift
//  MovieApp
//
//  Created by MZ01-MINCKAN on 2022/12/21.
//

import Foundation

// only url
// url + param
enum RequestType {
    case justURL(urlString: String)
    case urlWithParam(queries:[URLQueryItem])
}

enum MovieApiError:Error {
    case badURL
}



class NetworkLayer {
    typealias NetworkCompletion  = (_ data:Data?, _ response:URLResponse?, _ error: Error?) -> Void
    
    func request(type: RequestType, completion: @escaping NetworkCompletion) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)

        do {
            let request = try buildRequest(type: type)
            session.dataTask(with: request) { data, response, error in
               completion(data, response, error)
            }.resume()
            session.finishTasksAndInvalidate()

        }catch {
            print(error)
        }
      
    }
    
   private func buildRequest(type: RequestType) throws -> URLRequest {
        switch type {
        case .justURL(urlString: let urlString):
            guard let hasURL = URL(string: urlString) else {
                throw MovieApiError.badURL
            }
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            return request
        case .urlWithParam(queries: let queries):
            var components = URLComponents(string: "https://itunes.apple.com/search")
            components?.queryItems = queries
            guard let hasUrl = components?.url else {
                throw MovieApiError.badURL
            }
            
            var request = URLRequest(url: hasUrl)
            request.httpMethod = "GET"
            return request
        }
        
        
    }
    
}

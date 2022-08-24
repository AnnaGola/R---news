//
//  NetworkService.swift
//  R - news
//
//  Created by anna on 19.08.2022.
//

import UIKit

protocol NetworkServiceProtocol: AnyObject {
    var apiCall: APIProtocol { get }
    func getTopNews(country: String, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void)
    func searchNews(query: String, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void)
    func searchTopicNews(topic: String, country: String, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {

    var apiCall: APIProtocol
    
    init(apiCall: APIProtocol) {
        self.apiCall = apiCall
    }
    
    enum Response {
        case success
        case failure
    }
    
    func getTopNews(country: String, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void) {
        guard !country.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        let urlString = apiCall.setupTopNewsUrl(country: country)
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let county = try decoder.decode(NewsResponse.self, from: data)
                completion(Result.success(county))
            } catch {
                completion(Result.failure(.failedToGetData))
            }
        }
        task.resume()
    }
    
    func searchNews(query: String, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void) {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        let urlString = apiCall.setupNewsUrl(query: query)
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let query = try decoder.decode(NewsResponse.self, from: data)
                completion(Result.success(query))
            } catch {
                completion(Result.failure(.failedToGetData))
            }
        }
        task.resume()
    }
    
    func searchTopicNews(topic: String, country: String, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void) {
        guard !topic.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        guard !country.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        let urlString = apiCall.setupSpecificNewsUrl(topic: topic, country: country)
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            let decoder = JSONDecoder()
            do {
                let topicByCountry = try! decoder.decode(NewsResponse.self, from: data)
                completion(Result.success(topicByCountry))
            } catch {
                completion(Result.failure(.failedToGetData))
            }
        }
        task.resume()
    }
}

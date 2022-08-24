//
//  API.swift
//  R - news
//
//  Created by anna on 19.08.2022.
//

import UIKit

protocol APIProtocol {
    func setupTopNewsUrl(country: String) -> String
    func setupNewsUrl(query: String) -> String
    func setupSpecificNewsUrl(topic: String, country: String) -> String
}

struct API: APIProtocol {

    func setupTopNewsUrl(country: String) -> String {
        return Constants.baseUrl + Constants.topHeadlines + Constants.apiKey + Constants.ampersand + Constants.country + country
    }
    
    func setupNewsUrl(query: String) -> String {
        return Constants.baseUrl + Constants.everything + Constants.apiKey + Constants.ampersand + Constants.query + query
    }
   
    func setupSpecificNewsUrl(topic: String, country: String) -> String {
        return Constants.baseUrl + Constants.topHeadlines + Constants.category + topic + Constants.ampersand + Constants.country + country + Constants.ampersand + Constants.apiKey
    }
}

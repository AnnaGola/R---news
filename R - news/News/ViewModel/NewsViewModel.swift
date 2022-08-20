//
//  NewsViewModel.swift
//  R - news
//
//  Created by anna on 20.08.2022.
//

import Foundation

//MARK: - ViewModel Protocol
protocol NewsViewModelProtocol: AnyObject {
    var news: Bindable<[News]> { get set }
    var error: Bindable<NetworkError?> { get set }
    var title: Bindable<String> { get set }
    var isLoading: Bindable<Bool> { get set }
    var totalData: Int { get set }
    var searchText: String { get set }
    var country: String { get set }
    var topic: String { get set }
    func setCountryName()
    func setTopicName()
    func getTopNews(country: String)
    func searchNews(query: String)
    func searchSpecificNews(topic: String, country: String)
    func switchCase(result: Result<NewsResponse, NetworkError>)
    func success(for result: NewsResponse)
    func failure(of error: NetworkError)
}


final class NewsViewModel: NewsViewModelProtocol {
    
//MARK: - Properties
    let network: NetworkServiceProtocol
    var news: Bindable<[News]>
    var error: Bindable<NetworkError?>
    var title: Bindable<String>
    var isLoading: Bindable<Bool>
    var totalData: Int
    var searchText: String
    var country: String {
        didSet {
            getTopNews(country: country)
            setCountryName()
        }
    }
    var topic: String {
        didSet {
            searchSpecificNews(topic: topic, country: country)
            setTopicName()
        }
    }
    
//MARK: - Initilazing
    init(model: Bindable<[News]>, network: NetworkServiceProtocol, error: Bindable<NetworkError?>, title: Bindable<String>, isLoading: Bindable<Bool>, totalData: Int, searchText: String, country: String, topic: String) {
        self.network = network
        self.news = model
        self.error = error
        self.title = title
        self.isLoading = isLoading
        self.totalData = totalData
        self.searchText = searchText
        self.country = country
        self.topic = topic
        getTopNews(country: country)
        defer { setCountryName() }
    }
    
//MARK: - Naming
    func setCountryName() {
        title.value = "News" + " - " + country.uppercased()
    }
    
    func setTopicName() {
        title.value = "News" + " - " + country.uppercased() + "\(topic)"
    }

//MARK: - Network calls
    func getTopNews(country: String) {
        network.getTopNews(country: country) { [weak self] result in
            self?.switchCase(result: result)
        }
    }
    
    func searchNews(query: String) {
        network.searchNews(query: query) { [weak self] result in
            self?.switchCase(result: result)
        }
    }
    
    func searchSpecificNews(topic: String, country: String) {
        network.searchTopicNews(topic: topic, country: country) { [weak self] result in
            self?.switchCase(result: result)
        }
    }
    
//MARK: - Network response
    func switchCase(result: Result<NewsResponse, NetworkError>) {
        switch result {
        case .success(let data):
            success(for: data)
        case .failure(let error):
            failure(of: error)
        }
    }
    
    func success(for result: NewsResponse) {
        news.value = result.articles
        isLoading.value = false
        totalData = result.totalResults
    }
    
    func failure(of error: NetworkError) {
        self.error.value = error
        isLoading.value = false
        debugPrint(error.localizedDescription)
    }
}

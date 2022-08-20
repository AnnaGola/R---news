//
//  Assembly.swift
//  R - news
//
//  Created by anna on 20.08.2022.
//

import UIKit

final class Assembly {
    
    func configureNewsModule() -> UIViewController {
        let model = Bindable([News]())
        let apiCall = API()
        let networkService = NetworkService(apiCall: apiCall)
        let viewModel = NewsViewModel(
            model: model,
            network: networkService,
            error: Bindable(nil),
            title: Bindable(""),
            isLoading: Bindable(true),
            totalData: 0,
            searchText: "",
            country: "ru",
            topic: "")
        let newsVC = NewsViewController(viewModel: viewModel)
        return newsVC
    }
}

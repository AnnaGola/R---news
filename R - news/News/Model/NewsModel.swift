//
//  NewsModel.swift
//  R - news
//
//  Created by anna on 19.08.2022.
//

import UIKit

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [News]
}

struct News: Codable {
    let source: Source
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String
}

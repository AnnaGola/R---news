//
//  Constants .swift
//  R - news
//
//  Created by anna on 19.08.2022.
//

import UIKit

enum Constants {
    
    static let baseUrl = "https://newsapi.org/v2/"
    static let topHeadlines = "top-headlines?"
    static let everything = "everything?"
    static let apiKey = "apiKey=d8c42891254741528e8cd5acdb6ec5c9"
    
    static let country = "country="
    static let category = "category="
    static let query = "q="
    static let ampersand = "&"
    
    static let heightForHeader: CGFloat = 320
    static let heightForCell: CGFloat = 110
    static let heightForHeaderInSection: CGFloat = 50
    static let padding: CGFloat = 16
    
    static let allCountries = [
        (abbreviation: "ru", country: "Russia"),
        (abbreviation: "ar", country: "Argentina"),
        (abbreviation: "au", country: "Australia"),
        (abbreviation: "br", country: "Brazil"),
        (abbreviation: "ca", country: "Canada"),
        (abbreviation: "cn", country: "China"),
        (abbreviation: "fr", country: "France"),
        (abbreviation: "de", country: "Germany"),
        (abbreviation: "gb", country: "Great Britain"),
        (abbreviation: "it", country: "Italy"),
        (abbreviation: "in", country: "India"),
        (abbreviation: "jp", country: "Japan"),
        (abbreviation: "kr", country: "Korea"),
        (abbreviation: "mx", country: "Mexico"),
        (abbreviation: "no", country: "Norway"),
        (abbreviation: "se", country: "Sweden"),
        (abbreviation: "us", country: "United States")
    ]
    
    static let topics = [
        " Business",
        " Entertainment",
        " General",
        " Health",
        " Science",
        " Sports",
        " Technology"
    ]
}


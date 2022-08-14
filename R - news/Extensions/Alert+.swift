//
//  Alert+.swift
//  R - news
//
//  Created by anna on 14.08.2022.
//

import UIKit

extension UIViewController {
    
    func setAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}

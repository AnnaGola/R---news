//
//  TableView+.swift
//  R - news
//
//  Created by anna on 19.08.2022.
//

import UIKit

extension UITableView {
    
    func animate() {
        self.reloadData()
        
        let cells = self.visibleCells
        let tableViewHight = self.bounds.height
        
        var delayOfAnimation: Double = 0
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHight)
            
            UIView.animate(
                withDuration: 1,
                delay: delayOfAnimation * 0.1,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .curveEaseInOut) {
                    cell.transform = CGAffineTransform.identity
                }
            delayOfAnimation += 1
        }
    }
}

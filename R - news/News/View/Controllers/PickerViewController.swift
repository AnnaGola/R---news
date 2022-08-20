//
//  PickerViewController.swift
//  R - news
//
//  Created by anna on 20.08.2022.
//

import Foundation
import SnapKit

protocol PickerViewControllerDelegate: AnyObject {
    func setCountry(with country: String)
}

final class PickerViewController: UIViewController {
    
    weak var delegate: PickerViewControllerDelegate?
    lazy var constants = Constants.allCountries
    private lazy var countryPikerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCcontroller()
        setupCountryPicker()
        setupCloseButton()
    }
    
//MARK: - Setups
    private func setupViewCcontroller() {
        view.backgroundColor = .secondarySystemBackground
        navigationItem.title = "Choose a Country"
    }
    
    private func setupCountryPicker() {
        view.addSubview(countryPikerView)
        countryPikerView.delegate = self
        countryPikerView.dataSource = self
        countryPikerView.backgroundColor = .secondarySystemBackground

        countryPikerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupCloseButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(closeButtonTapped))
    }
    
    @objc private func closeButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Picker extension
extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.allCountries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.allCountries[row].country
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.setCountry(with: Constants.allCountries[row].abbreviation)
        closeButtonTapped()
    }
}

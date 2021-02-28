//
//  ThirdViewController.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet var intervalSegment: UISegmentedControl!
    @IBOutlet var outputSizeSegment: UISegmentedControl!
    @IBOutlet var apiKeyTextField: UITextField!
    
    let intervalItems = ["1min", "5min", "15min", "30min", "60min"]
    let outputSizeItems = ["compact", "full"]

    var intervalValue: String?
    var outputValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        title = "Configuration"
        
        apiKeyTextField.delegate = self
        
        let interval = Storage.loadItem(key: .interval)
        let indexInterval = intervalItems.firstIndex(where: { $0 == interval })
        intervalSegment.selectedSegmentIndex = indexInterval ?? 0
        
        let outputSize = Storage.loadItem(key: .outputSize)
        let indexOutputSize = outputSizeItems.firstIndex(where: { $0 == outputSize })
        outputSizeSegment.selectedSegmentIndex = indexOutputSize ?? 0
        
        let apiKey = Keychain.load(key: .apiKey)
        let key = apiKey?.to(type: String.self) ?? "GACKQN6MJLZNACFL"
        apiKeyTextField.text = key
    }

    @IBAction func segmentChangeValue(_ sender: UISegmentedControl) {
        switch sender {
        case intervalSegment:
            intervalValue = intervalItems[sender.selectedSegmentIndex]
        case outputSizeSegment:
            outputValue = outputSizeItems[sender.selectedSegmentIndex]
        default:
            break
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let data = Data(from: apiKeyTextField.text)
        Keychain.save(key: .apiKey, data: data)

        Storage.saveItem(value: intervalValue ?? "5min", key: .interval)
        Storage.saveItem(value: outputValue ?? "compact", key: .outputSize)
        navigationController?.popViewController(animated: true)
    }
}

extension ThirdViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        apiKeyTextField.text = textField.text
    }
}

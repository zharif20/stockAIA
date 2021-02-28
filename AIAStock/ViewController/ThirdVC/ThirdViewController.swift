//
//  ThirdViewController.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "apiCell", for: indexPath)
        
        
        return cell
    }
    
    
}

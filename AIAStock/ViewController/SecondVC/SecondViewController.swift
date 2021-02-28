//
//  SecondViewController.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    var interactor: SecondBusinessLogic?
    
    @IBOutlet weak var searchDailyBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var symbolCount = 0
    var symbols = [String]()
    var fetchSymbols = [String]()
    var stockCompanies = [SecondModel]()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = SecondInteractor()
        let presenter = SecondPresenter()

        interactor.presenter = presenter
        viewController.interactor = interactor
        presenter.viewController = viewController
    }
    
    private func setupUI() {
        searchDailyBar.delegate = self

        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension SecondViewController: SecondDisplayLogic {
    func successFetchedItems(viewModel: SecondModel) {
        symbolCount += 1
        fetchSymbols.append(viewModel.companySymbol)
        stockCompanies.append(viewModel)
        
        if symbols.count == symbolCount {
            symbolCount = 0
            
            tableView.reloadData()
        }
    }
    
    func errorFetchingItems(error: Error) {
        let alert = UIAlertController(title: "Error!",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        let confirm = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockCompanies.first?.companyStockPrice.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stockCompanies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyCell", for: indexPath) as! DailyAdjTableViewCell
        
        let cellText = stockCompanies[indexPath.section].companyStockPrice[indexPath.row]
        cell.dateLabel.text = cellText.dailyDate
        cell.openLabel.text = "Open: \(cellText.dailyOpen)"
        cell.lowLabel.text = "Low: \(cellText.dailyLow)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print(symbols)
        if section < fetchSymbols.count {
            return fetchSymbols[section].uppercased()
        }
        
        return nil
    }
}

extension SecondViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text?.replacingOccurrences(of: " ", with: "")
        let symbolStr = text?.components(separatedBy: ",")
        let symbolsStr = symbolStr.flatMap { $0 }
        
        guard let symbols = symbolsStr else { return }
        self.symbols = symbols
        for symbol in symbols {
            interactor?.fetchItems(symbol: symbol)
        }
    }
}

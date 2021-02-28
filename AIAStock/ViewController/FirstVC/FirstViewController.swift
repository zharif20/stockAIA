//
//  FirstViewController.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import UIKit

enum SortType {
    case open
    case high
    case low
    case date
}

class FirstViewController: UIViewController {

    var interactor: FirstBusinessLogic?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: FirstModel?
    
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
        setupView()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = FirstInteractor()
        let presenter = FirstPresenter()

        interactor.presenter = presenter
        viewController.interactor = interactor
        presenter.viewController = viewController
    }
    
    private func setupView() {
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "HeaderIntraTableViewCell", bundle: nil), forCellReuseIdentifier: "intraHeader")
        
        searchBar.delegate = self
    }
    
    private func sortData(type: SortType) {
        let sortedItem = viewModel?.companyStockPrice.sorted {
            switch type {
            case .open:
                return $0.dailyOpen < $1.dailyOpen
            case .high:
                return $0.dailyHigh < $1.dailyHigh
            case .low:
                return $0.dailyLow < $1.dailyLow
            case .date:
                return $0.dailyDate < $1.dailyDate
            }
        }
        
        viewModel = nil
        viewModel = FirstModel(prices: sortedItem ?? [])
        
        tableView.reloadData()
    }

}

extension FirstViewController: FirstDisplayLogic {
    func successFetchedItems(viewModel: FirstModel) {
        print(viewModel)
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(error: Error) {
        print(error.localizedDescription)
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.companyStockPrice.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "intraCell", for: indexPath) as! IntraTableViewCell
        if let viewModel = viewModel {
            let item = viewModel.companyStockPrice[indexPath.row]
            cell.openValue.text = String(item.dailyOpen)
            cell.highValue.text = String(item.dailyHigh)
            cell.lowValue.text = String(item.dailyLow)
            cell.dateValue.text = String(item.dailyDate)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "intraHeader") as! HeaderIntraTableViewCell
        header.openButton.addTarget(self, action: #selector(sortByTag(button:)), for: .touchUpInside)
        header.highButton.addTarget(self, action: #selector(sortByTag(button:)), for: .touchUpInside)
        header.lowButton.addTarget(self, action: #selector(sortByTag(button:)), for: .touchUpInside)
        header.dateButton.addTarget(self, action: #selector(sortByTag(button:)), for: .touchUpInside)

        return header.contentView
    }
    
    @objc private func sortByTag(button: UIButton) {
        var type: SortType = .open
        switch button.tag {
        case 0: type = .open
        case 1: type = .high
        case 2: type = .low
        case 3: type = .date
        default: type = .open
        }
        sortData(type: type)
    }
}

extension FirstViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, text.count == 3 {
            interactor?.fetchItems(symbol: text)
        } else {
            print("Max/min symbol 3")
        }
    }
}

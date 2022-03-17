//
//  HistoryViewController.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 17.03.2022.
//

import UIKit

private let cellID = "Cell"

class HistoryViewController: UIViewController {
    
    let tableView = UITableView()
    var viewModel: HistoryViewModel? {
        didSet {
            viewModel?.fetchTransactions {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HistoryViewModel()
        setup()
    }
}

// MARK: - Setup Table View
extension HistoryViewController {
    private func setup() {
        title = "History"
        navigationController?.navigationBar.backgroundColor = .backgroundWhite
        
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HistoryViewCell.self, forCellReuseIdentifier: cellID)
        tableView.sectionHeaderTopPadding = 0
        tableView.separatorStyle = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            )
        ])
    }
}

// MARK: - UITableViewDataSource
extension HistoryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard
            let numberOfSection = viewModel?.numberOfSection()
        else { return 0}
        
        return numberOfSection
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        guard
            let titleSection = viewModel?.titleForHeaderSection(section)
        else { return "" }
        
        return titleSection
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        guard
            let numberOfRows = viewModel?.numberOfRowsInSection(section)
        else { return 0 }
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let viewModel = viewModel,
            let cell = tableView.dequeueReusableCell(
                withIdentifier: cellID,
                for: indexPath
            ) as? HistoryViewCell
        else { return UITableViewCell() }
        
        let transaction = viewModel.getTransaction(forIndexPath: indexPath)
        
        cell.transaction = transaction
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        80
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        80
    }
    
    func tableView(
        _ tableView: UITableView,
        willDisplayHeaderView view: UIView,
        forSection section: Int
    ) {
        view.tintColor = .tileBrown
    }
}

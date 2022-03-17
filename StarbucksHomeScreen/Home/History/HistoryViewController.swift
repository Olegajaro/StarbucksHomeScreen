//
//  HistoryViewController.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 17.03.2022.
//

import UIKit

struct HistorySection {
    let title: String
    let transactions: [Transaction]
}

private let cellID = "Cell"

class HistoryViewController: UIViewController {
    
    let tableView = UITableView()
    let numbers = [1, 2, 3, 4]
    var sections: [HistorySection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        testData()
    }
    
    func testData() {
        let tx1 = Transaction(
            id: 1, type: "redeemable", amount: "1",
            description: nil, date: Date()
        )
        let tx2 = Transaction(
            id: 1, type: "redeemable", amount: "2",
            description: nil, date: Date()
        )
        let tx22 = Transaction(
            id: 1, type: "redeemable", amount: "22",
            description: nil, date: Date()
        )
        let tx3 = Transaction(
            id: 1, type: "redeemable", amount: "3",
            description: nil, date: Date()
        )
        let tx33 = Transaction(
            id: 1, type: "redeemable", amount: "33",
            description: nil, date: Date()
        )
        let tx333 = Transaction(
            id: 1, type: "redeemable", amount: "333",
            description: nil, date: Date()
        )
        
        let firstSection = HistorySection(title: "July", transactions: [tx1])
        let secondSection = HistorySection(title: "June", transactions: [tx2, tx22])
        let thirdSection = HistorySection(title: "May", transactions: [tx3, tx33, tx333])
        
        sections.append(firstSection)
        sections.append(secondSection)
        sections.append(thirdSection)
    }
}

// MARK: - Setup Table View
extension HistoryViewController {
    private func setup() {
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
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
        sections.count
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        sections[section].title
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        sections[section].transactions.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellID,
            for: indexPath
        )
        
        let transaction = sections[indexPath.section].transactions[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = transaction.amount
        content.secondaryText = transaction.date.description
        
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

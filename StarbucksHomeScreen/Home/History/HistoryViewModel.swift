//
//  HistoryViewModel.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 17.03.2022.
//

import Foundation

struct HistorySection {
    let title: String
    let transactions: [Transaction]
}

class HistoryViewModel {
    
    // Output for display
    private var sections: [HistorySection] = []
    
    // input
    private var transactions: [Transaction]? {
        didSet {
            guard let txs = transactions else { return }
            
            // filter by month - hard coded
            let firstMonth = "Jul"
            let secondMonth = "Jun"
            let thirdMonth = "May"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            
            let firstMonthTransactions = txs.filter {
                let dateString = dateFormatter.string(from: $0.date)
                return dateString.starts(with: firstMonth)
            }
            
            let secondMonthTransactions = txs.filter {
                let dateString = dateFormatter.string(from: $0.date)
                return dateString.starts(with: secondMonth)
            }
            
            let thirdMonthTransactions = txs.filter {
                let dateString = dateFormatter.string(from: $0.date)
                return dateString.starts(with: thirdMonth)
            }
            
            // create sections
            let firstMonthSection = HistorySection(
                title: "July",
                transactions: firstMonthTransactions
            )
            let secondMonthSection = HistorySection(
                title: "June",
                transactions: secondMonthTransactions
            )
            let thirdMonthSection = HistorySection(
                title: "May",
                transactions: thirdMonthTransactions
            )
            
            sections.append(firstMonthSection)
            sections.append(secondMonthSection)
            sections.append(thirdMonthSection)
        }
    }
    
    func fetchTransactions(completion: @escaping () -> Void) {
        NetworkService.shared.fetchTransactions { [weak self] result in
            switch result {
            case .success(let transactions):
                self?.transactions = transactions
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfSection() -> Int {
        sections.count
    }
    
    func titleForHeaderSection(_ section: Int) -> String {
        sections[section].title
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        sections[section].transactions.count
    }
    
    func getTransaction(forIndexPath indexPath: IndexPath) -> Transaction {
        return sections[indexPath.section].transactions[indexPath.row]
    }
}

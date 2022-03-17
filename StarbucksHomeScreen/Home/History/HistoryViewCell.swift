//
//  HistoryViewCell.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 17.03.2022.
//

import UIKit

class HistoryViewCell: UITableViewCell {
    
    let starView = makeSymbolImageView(systemName: "star")
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    
    var transaction: Transaction? {
        didSet {
            guard let tx = transaction else { return }
            titleLabel.text = "\(tx.amount) Stars \(tx.type)"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d"
            dateLabel.text = dateFormatter.string(from: tx.date)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        config()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HistoryViewCell {
    func config() {
        backgroundColor = .tileBrown
        selectionStyle = .none
        
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.tintColor = .starYellow
        starView.contentMode = .scaleAspectFit
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(starView)
        addSubview(titleLabel)
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            starView.centerYAnchor.constraint(equalTo: centerYAnchor),
            starView.leadingAnchor.constraint(
                equalToSystemSpacingAfter: leadingAnchor,
                multiplier: 2
            ),
            starView.widthAnchor.constraint(equalToConstant: 36),
            starView.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalToSystemSpacingAfter: starView.trailingAnchor,
                multiplier: 2
            ),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(
                equalToSystemSpacingAfter: dateLabel.trailingAnchor,
                multiplier: 4
            ),
            dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

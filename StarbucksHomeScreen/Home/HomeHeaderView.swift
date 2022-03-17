//
//  HomeHeaderView.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 13.03.2022.
//

import UIKit

protocol HomeHeaderViewDelegate: AnyObject {
    func showHistoryView()
}

class HomeHeaderView: UIView {
    
    // MARK: - UIElements
    let greeting = UILabel()
    let inboxButton = UIButton(type: .system)
    let historyButton = UIButton(type: .system)
    
    weak var delegate: HomeHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Style and Layout functions
extension HomeHeaderView {
    private func style() {
        backgroundColor = .white
        
        greeting.translatesAutoresizingMaskIntoConstraints = false
        greeting.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greeting.text = "Good afternoon, Oleg ☀️"
        greeting.numberOfLines = 0
        greeting.lineBreakMode = .byWordWrapping
        
        makeInboxButton()
        makeHistoryButton()
        historyButton.addTarget(self,
                                action: #selector(historyButtonTapped),
                                for: .touchUpInside)
    }
    
    private func layout() {
        addSubview(greeting)
        addSubview(inboxButton)
        addSubview(historyButton)
        
        // greeting
        NSLayoutConstraint.activate([
            greeting.topAnchor.constraint(
                equalToSystemSpacingBelow: topAnchor,
                multiplier: 1
            ),
            greeting.leadingAnchor.constraint(
                equalToSystemSpacingAfter: leadingAnchor,
                multiplier: 2
            ),
            trailingAnchor.constraint(
                equalToSystemSpacingAfter: greeting.trailingAnchor,
                multiplier: 2)
            
        ])
        
        // inbox
        NSLayoutConstraint.activate([
            inboxButton.topAnchor.constraint(
                equalToSystemSpacingBelow: greeting.bottomAnchor,
                multiplier: 2
            ),
            inboxButton.leadingAnchor.constraint(
                equalToSystemSpacingAfter: leadingAnchor,
                multiplier: 2
            ),
            bottomAnchor.constraint(
                equalToSystemSpacingBelow: inboxButton.bottomAnchor,
                multiplier: 1
            )
        ])
        
        // history
        NSLayoutConstraint.activate([
            historyButton.centerYAnchor.constraint(equalTo: inboxButton.centerYAnchor),
            historyButton.leadingAnchor.constraint(equalToSystemSpacingAfter: inboxButton.trailingAnchor, multiplier: 2)
        ])
    }
    
    // MARK: - Actions
    @objc func historyButtonTapped() {
        delegate?.showHistoryView()
    }
}

// MARK: - Factories
extension HomeHeaderView {
    private func makeInboxButton() {
        makeButton(button: inboxButton, systemName: "envelope", text: " Inbox")
    }
    
    private func makeHistoryButton() {
        makeButton(button: historyButton, systemName: "calendar", text: " History")
    }
    
    private func makeButton(button: UIButton, systemName: String, text: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: systemName,
                            withConfiguration: configuration)
        
        button.setImage(image, for: .normal)
        button.setTitle(text, for: .normal)
        button.tintColor = .secondaryLabel
    }
}

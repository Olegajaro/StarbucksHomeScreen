//
//  HomeHeaderView.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 13.03.2022.
//

import UIKit

class HomeHeaderView: UIView {
    
    // MARK: - UIElements
    let greeting = UILabel()
    let inboxButton = UIButton(type: .system)
    
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
        greeting.translatesAutoresizingMaskIntoConstraints = false
        greeting.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greeting.text = "Good afternoon, Oleg ☀️"
        greeting.numberOfLines = 0
        greeting.lineBreakMode = .byWordWrapping
        
        makeInboxButton()
    }
    
    private func layout() {
        addSubview(greeting)
        addSubview(inboxButton)
        
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
    }
}

// MARK: - Factories
extension HomeHeaderView {
    private func makeInboxButton() {
        inboxButton.translatesAutoresizingMaskIntoConstraints = false
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "envelope",
                            withConfiguration: configuration)
        
        inboxButton.setImage(image, for: .normal)
        inboxButton.setTitle(" Inbox", for: .normal)
        inboxButton.tintColor = .secondaryLabel
    }
}

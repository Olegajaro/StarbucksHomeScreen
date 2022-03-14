//
//  TileView.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 14.03.2022.
//

import UIKit

class TileView: UIView {
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let ctaButton = makeGreenButton(withText: "Order")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 300)
    }
}

extension TileView {
    // MARK: - Style function
    private func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "meatless")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        titleLabel.textColor = .label
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.lineBreakMode = .byWordWrapping
    }
    
    // MARK: - Layout function
    private func layout() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(ctaButton)
        
        // imageView constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        // titleLabel constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalToSystemSpacingBelow: imageView.bottomAnchor,
                multiplier: 2
            ),
            titleLabel.leadingAnchor.constraint(
                equalToSystemSpacingAfter: leadingAnchor,
                multiplier: 2
            ),
            trailingAnchor.constraint(
                equalToSystemSpacingAfter: titleLabel.trailingAnchor,
                multiplier: 2
            )
        ])
        
        // subtitleLabel constraints
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(
                equalToSystemSpacingBelow: titleLabel.bottomAnchor,
                multiplier: 2
            ),
            subtitleLabel.leadingAnchor.constraint(
                equalTo: titleLabel.leadingAnchor
            ),
            subtitleLabel.trailingAnchor.constraint(
                equalTo: titleLabel.trailingAnchor
            )
        ])
        
        // ctaButton constraints
        NSLayoutConstraint.activate([
            ctaButton.topAnchor.constraint(
                equalToSystemSpacingBelow: subtitleLabel.bottomAnchor,
                multiplier: 2
            ),
            ctaButton.leadingAnchor.constraint(
                equalTo: titleLabel.leadingAnchor
            ),
            bottomAnchor.constraint(
                equalToSystemSpacingBelow: ctaButton.bottomAnchor,
                multiplier: 2
            )
        ])
    }
}

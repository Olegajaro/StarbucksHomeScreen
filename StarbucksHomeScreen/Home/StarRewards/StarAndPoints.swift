//
//  StarAndPoints.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 15.03.2022.
//

import UIKit

class StarAndPoints: UIView {
    
    let pointsLabel = UILabel()
    let starView = makeSymbolImageView(systemName: "star.fill", scale: .small)
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 60, height: 16)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StarAndPoints {
    private func style() {
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.preferredFont(forTextStyle: .callout).bold()
        pointsLabel.textAlignment = .right
        
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.tintColor = .starYellow
        starView.contentMode = .scaleAspectFit
    }
    
    private func layout() {
        addSubview(pointsLabel)
        addSubview(starView)
        
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(
                equalTo: topAnchor, constant: 2
            ),
            pointsLabel.trailingAnchor.constraint(
                equalTo: starView.leadingAnchor, constant: -2
            )
        ])
        
        NSLayoutConstraint.activate([
            starView.trailingAnchor.constraint(equalTo: trailingAnchor),
            starView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

//
//  RewardsTileView.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 14.03.2022.
//

import UIKit

class RewardsTileView: UIView {
    
    let balanceView = BalanceView()
    var rewardsButton = UIButton(type: .system)
    let rewardsGraphView = RewardsGraphView()
    let starRewardsView = UIView()
    var detailsButton = makeClearButton(withText: "Details")
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 300)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Redraw our graph once we know our actual device width & height
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rewardsGraphView.actualFrameWidth = frame.width
        rewardsGraphView.drawRewardsGraph()
    }
}

extension RewardsTileView {
    // MARK: - Style method
    private func style() {
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        rewardsGraphView.translatesAutoresizingMaskIntoConstraints = false
        starRewardsView.translatesAutoresizingMaskIntoConstraints = false
        
        makeRewardsOptionButton()
    }
    
    private func makeRewardsOptionButton() {
        rewardsButton.translatesAutoresizingMaskIntoConstraints = false
        rewardsButton.configuration = .plain()
        
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(
            systemName: "chevron.down",
            withConfiguration: configuration
        )
        
        rewardsButton.setImage(image, for: .normal)
        rewardsButton.tintColor = .label
        
        let titleAttributes: [NSAttributedString.Key : Any] = [
            .font : UIFont.preferredFont(forTextStyle: .footnote)
        ]
        rewardsButton.configuration?.attributedTitle = AttributedString(
            "Rewards options",
            attributes: AttributeContainer(titleAttributes)
        )

        rewardsButton.semanticContentAttribute = .forceRightToLeft
        rewardsButton.configuration?.imagePadding = 15
    }
    
    // MARK: - Layout method
    private func layout() {
        addSubview(balanceView)
        addSubview(rewardsButton)
        addSubview(rewardsGraphView)
        addSubview(starRewardsView)
        addSubview(detailsButton)
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(
                equalToSystemSpacingAfter: leadingAnchor,
                multiplier: 2
            )
        ])
        
        NSLayoutConstraint.activate([
            rewardsButton.centerYAnchor.constraint(
                equalTo: balanceView.centerYAnchor
            ),
            trailingAnchor.constraint(
                equalToSystemSpacingAfter: rewardsButton.trailingAnchor,
                multiplier: 3
            )
        ])
        
        NSLayoutConstraint.activate([
            rewardsGraphView.topAnchor.constraint(
                equalToSystemSpacingBelow: balanceView.bottomAnchor,
                multiplier: 1
            ),
            rewardsGraphView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rewardsGraphView.widthAnchor.constraint(equalToConstant: frame.width)
        ])
        
        NSLayoutConstraint.activate([
            starRewardsView.topAnchor.constraint(
                equalToSystemSpacingBelow: rewardsGraphView.bottomAnchor,
                multiplier: 1
            ),
            starRewardsView.leadingAnchor.constraint(
                equalToSystemSpacingAfter: leadingAnchor,
                multiplier: 1
            ),
            trailingAnchor.constraint(
                equalToSystemSpacingAfter: starRewardsView.trailingAnchor,
                multiplier: 1
            )
        ])
        
        NSLayoutConstraint.activate([
            detailsButton.leadingAnchor.constraint(
                equalTo: balanceView.leadingAnchor
            ),
            bottomAnchor.constraint(
                equalToSystemSpacingBelow: detailsButton.bottomAnchor,
                multiplier: 2
            )
        ])
    }
}

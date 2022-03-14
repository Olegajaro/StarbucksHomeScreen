//
//  ViewController.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 13.03.2022.
//

import UIKit

class HomeViewController: StarbucksViewController {

    // MARK: - UIElements
    let headerView = HomeHeaderView()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    var headerViewTopConstraint: NSLayoutConstraint?
        
    let tiles = [
        TileViewController(
            title: "Breakfast made meatless",
            subtitle: "Try the Beyond Meat, Cheddar & Egg Breakfast Sandwich. Vegetarian and protein-packed.",
            imageName: "meatless"
        ),
        TileViewController(
            title: "Uplifting our communities",
            subtitle: "Thanks to our partners nominations, The Starbucks Foundation is donating $145K to more than 50 local charities.",
            imageName: "communities"
        ),
        TileViewController(
            title: "Spend at least $15 for 50 Bonus Stars",
            subtitle: "Collect 50 Bonus Stars when you spend at least $15 pre-tax.",
            imageName: "bonus"
        )
    ]
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupScrollView()
        setupTabBarImage(imageName: "house.fill", title: "Home")
        style()
        layout()
    }
    
    // MARK: - Setup Views
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good afternoon, Oleg ☀️"
    }
    
    private func setupScrollView() {
        scrollView.delegate = self
    }
}

// MARK: - Style and Layout function
extension HomeViewController {
    private func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .systemBackground
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 8
    }
    
    private func layout() {
        view.addSubview(headerView)
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        for tile in tiles {
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }
        
        // headerView constraint
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(
                equalTo: headerView.bottomAnchor, constant: 8
            ),
            scrollView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 8
            ),
            scrollView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -8
            ),
            scrollView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}

// MARK: - UIScrollViewDelegate
extension HomeViewController: UIScrollViewDelegate {
    // Collapsible header
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        let swipingDown = y <= 0
        let shouldSnap = y > 30
        let labelHeight = headerView.greeting.frame.height + 16 // label + spacer (102)
        
        UIView.animate(withDuration: 0.3) {
            self.headerView.greeting.alpha = swipingDown ? 1.0 : 0.0
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: 0.3, delay: 0, options: []) {
                self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
                self.view.layoutIfNeeded()
            }
    }
}



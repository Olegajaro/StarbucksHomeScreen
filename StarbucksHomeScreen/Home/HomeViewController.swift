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
    var headerViewTopConstraint: NSLayoutConstraint?
        
    let titles = [
        "Star balance",
        "Bonus stars",
        "Try these",
        "Welcome back",
        "Uplifting"
    ]
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTabBarImage(imageName: "house.fill", title: "Home")
        style()
        layout()
    }
    
    // MARK: - Setup TableView
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good afternoon, Oleg ☀️"
    }
}

// MARK: - Style and Layout function
extension HomeViewController {
    private func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .systemBackground
    }
    
    private func layout() {
        view.addSubview(headerView)
        
        // headerView constraint
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
//    // Collapsible header
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let y = scrollView.contentOffset.y
//
//        let swipingDown = y <= 0
//        let shouldSnap = y > 30
//        let labelHeight = headerView.greeting.frame.height + 16 // label + spacer (102)
//
//        UIView.animate(withDuration: 0.3) {
//            self.headerView.greeting.alpha = swipingDown ? 1.0 : 0.0
//        }
//
//        UIViewPropertyAnimator.runningPropertyAnimator(
//            withDuration: 0.3, delay: 0, options: []) {
//                self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
//                self.view.layoutIfNeeded()
//            }
//    }


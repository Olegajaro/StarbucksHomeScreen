//
//  ViewController.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 13.03.2022.
//

import UIKit

class HomeViewController: StarbucksViewController {

    let headerView = HomeHeaderView()
    let tableView = UITableView()
    
    let cellID = "cellID"
    let titles = [
        "Star balance",
        "Bonus stars",
        "Try these",
        "Welcome back",
        "Uplifting"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
        setupTabBarImage(imageName: "house.fill", title: "Home")
        style()
        layout()
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good afternoon, Oleg ☀️"
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
}

extension HomeViewController {
    private func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .systemTeal
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(headerView)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        titles.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellID, for: indexPath
        )
        
        cell.textLabel?.text = titles[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        300
    }
}

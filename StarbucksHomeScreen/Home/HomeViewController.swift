//
//  ViewController.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 13.03.2022.
//

import UIKit

class HomeViewController: StarbucksViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTabBarImage(imageName: "house.fill", title: "Home")
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good afternoon, Oleg ☀️"
    }
}


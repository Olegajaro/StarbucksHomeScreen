//
//  TileViewController.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 14.03.2022.
//

import UIKit

class TileViewController: UIViewController {
    
    let tileView = TileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension TileViewController {
    private func style() {
        tileView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(tileView)
        
        NSLayoutConstraint.activate([
            tileView.topAnchor.constraint(equalTo: view.topAnchor),
            tileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tileView.bottomAnchor.constraint(equalTo: view.bottomAnchor )
        ])
    }
}

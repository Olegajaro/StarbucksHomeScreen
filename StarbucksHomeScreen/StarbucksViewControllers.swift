//
//  StarbucksViewControllers.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 13.03.2022.
//

import UIKit

class StarbucksViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        
    }
    
    func setupTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}

class ScanViewController: StarbucksViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        title = "Scan"
    }
    
    override func commonInit() {
        setupTabBarImage(imageName: "qrcode", title: "Scan")
    }
}

class OrderViewController: StarbucksViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemOrange
        title = "Order"
    }
    
    override func commonInit() {
        setupTabBarImage(imageName: "arrow.up.bin.fill", title: "Order")
    }
}

class GiftViewController: StarbucksViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        title = "Gift"
    }
    
    override func commonInit() {
        setupTabBarImage(imageName: "gift.fill", title: "Gift")
    }
}

class StoreViewController: StarbucksViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
        title = "Stores"
    }
    
    override func commonInit() {
        setupTabBarImage(imageName: "location.fill", title: "Stores")
    }
}

//
//  BaseViewController.swift
//  BaseViewController
//
//  Created by Sanjeev Kumar on 31/10/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.lightGray
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.orange]
    }


}

//
//  DetailsViewController.swift
//  CustomNavigationBar
//
//  Created by Viswa Kodela on 6/23/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK:- Properties
    
    // MARK:- Inits
    
    // MARK:- Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLyout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK:-  Helper Methods
    func configureLyout() {
        view.backgroundColor = .white
    }
    
}

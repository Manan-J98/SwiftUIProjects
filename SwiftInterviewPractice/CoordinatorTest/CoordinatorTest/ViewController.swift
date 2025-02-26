//
//  ViewController.swift
//  CoordinatorTest
//
//  Created by Manan Juneja on 2025-02-19.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var button = UIButton()
        button.titleLabel?.text = "Hi"
    }


}


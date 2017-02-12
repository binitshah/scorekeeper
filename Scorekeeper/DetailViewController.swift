//
//  DetailViewController.swift
//  Scorekeeper
//
//  Created by Binit Shah on 2/12/17.
//  Copyright © 2017 Binit Shah. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // This variable will hold the data being passed from the First View Controller
    var name: String! = "";
    var score: Int! = 0;
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personLabel.text = "\(name!)";
        scoreLabel.text = "\(score!)";
    }
}

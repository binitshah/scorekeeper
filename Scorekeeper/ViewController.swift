//
//  ViewController.swift
//  Scorekeeper
//
//  Created by Binit Shah on 2/12/17.
//  Copyright © 2017 Binit Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var scores = ["Person One": 0, "Person Two": 0, "Person Three": 0, "Person Four": 0, "Person Five": 0];
    @IBOutlet weak var scoreTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.automaticallyAdjustsScrollViewInsets = false;
        self.title = "Scores";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = scoreTableView.indexPathForSelectedRow {
            let selectedRow = indexPath.row;
            let detailViewController = segue.destination as! DetailViewController;
            let name = Array(scores.keys)[selectedRow];
            detailViewController.name = name;
            detailViewController.score = scores[name];
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "score", for: indexPath) as! ScoreCell;
        
        let row = indexPath.row;
        let name = Array(scores.keys)[row];
        cell.decorate(for: name, in: self);
        
        return cell;
    }

}

class ScoreCell: UITableViewCell {
    var name: String!;
    var controller: ViewController!;
    
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func subtractButton(_ sender: UIButton) {
        updateScore(offset: -1);
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        updateScore(offset: 1);
    }
    
    func decorate(for name: String, in controller: ViewController) {
        let score = controller.scores[name] ?? 0;
        self.personLabel.text = "\(name)";
        self.scoreLabel.text = "Score: \(score)";
        
        self.name = name;
        self.controller = controller;
    }
    
    func updateScore(offset: Int) {
        var score = controller.scores[name] ?? 0;
        score += offset;
        controller.scores[name] = score;
        
        self.personLabel.text = "\(name ?? "Unnamed Person")";
        self.scoreLabel.text = "Score: \(score)";
    }
}
















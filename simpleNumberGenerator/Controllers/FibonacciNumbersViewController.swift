//
//  FibonacciNumbersViewController.swift
//  simpleNumberGenerator
//
//  Created by Admin on 07.02.2021.
//  Copyright © 2021 DmitryChaschin. All rights reserved.
//

import UIKit

class FibonacciNumbersViewController: UITableViewController {

    var fib = Fibonacci.getFibonacciArray(fromStartInt: true, to: 50, with: nil)
      var scrollIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "cell")

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let fib = fib else {return 0}
        return fib.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        let currentArr = fib![indexPath.row]
        
        cell.leftLabel.numberOfLines = 0;
        cell.leftLabel.lineBreakMode = .byClipping
        cell.rightLabel.numberOfLines = 0;
        cell.rightLabel.lineBreakMode = .byClipping
        
        cell.leftLabel.text = String(currentArr[0])
        cell.rightLabel.text = String(currentArr[1])
        
        
        return cell
    }
    
    //MARK: - TableView Delegate -
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
         return UITableView.automaticDimension
     }
    

}

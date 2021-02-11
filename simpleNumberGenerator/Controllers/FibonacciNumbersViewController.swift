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
        tableView.allowsSelection = false
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    // MARK: - TableView DataSource -
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let fib = fib else {return 0}
        return fib.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        let currentArr = fib![indexPath.row]
        cell.leftLabel.text = String(currentArr[0])
        cell.rightLabel.text = String(currentArr[1])
        return cell
    }
    
    //MARK: - TableView Delegate -
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let fibonacciCell = cell as! Cell
        if indexPath.row == self.fib!.count - 1 {
            scrollIndex += 1
            
             let queue = DispatchQueue.init(label: "back", qos: .default, attributes: .concurrent, autoreleaseFrequency: .never, target: nil)
                       queue.async {
                self.fetchNewFibonacciArr(indexPath: indexPath)
            }
                tableView.reloadData()
            
        }
        fibonacciCell.configurateCell(cell: fibonacciCell, indexPath: indexPath)
    }
    
    //MARK: - Fetch New Arr Method -
    func fetchNewFibonacciArr(indexPath: IndexPath) {
        let lastFibArray = fib?.last!
        let nextFibArray = Fibonacci.getFibonacciArray(fromStartInt: false, to: 30, with: lastFibArray)
        for arr in nextFibArray! {
            fib?.append(arr)
        }
    }
    
}

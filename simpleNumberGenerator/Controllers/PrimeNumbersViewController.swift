//
//  ViewController.swift
//  simpleNumberGenerator
//
//  Created by Admin on 05.02.2021.
//  Copyright © 2021 DmitryChaschin. All rights reserved.
//

import UIKit

class PrimeNumbersViewController: UITableViewController {
    var prime = PrimeNumbers.generate(upperBound: 200, from: 2) // upperBound >= 200
    var scrollIndex = 1
    let queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.prefetchDataSource = self
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    //MARK: - TableView DataSource -
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prime.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        let currentArr = prime[indexPath.row]
        cell.leftLabel.text = String(currentArr[0])
        cell.rightLabel.text = String(currentArr[1])
        return cell
    }
    
    //MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let primeCell = cell as! Cell
        if indexPath.row == prime.count - 1 {
            scrollIndex += 1
            fetchNewPrimeArr()
            DispatchQueue.main.async {
              tableView.reloadData()
            }
        }
        primeCell.configurateCell(cell: primeCell, indexPath: indexPath)
    }
    
    
    
    
    
    func fetchNewPrimeArr() {
        let lastPrimeNum = prime.last?.last
        var nextPrimeNumArray = PrimeNumbers.findPrimeNumberlist(fromNumber: lastPrimeNum!, toNumber: scrollIndex * 300)

        let lastPrimeArr = nextPrimeNumArray.last!
        if lastPrimeArr.count == 1 {
            nextPrimeNumArray.removeLast()
        }
        for arrOfPrimeNum in nextPrimeNumArray {
            self.prime.append(arrOfPrimeNum)
        }
    }
    
    
    
}


extension PrimeNumbersViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print(indexPaths)
        
      
    }
    
    
    
   
    
}

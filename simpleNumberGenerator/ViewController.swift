//
//  ViewController.swift
//  simpleNumberGenerator
//
//  Created by Admin on 05.02.2021.
//  Copyright © 2021 DmitryChaschin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var prime = PrimeNumbers.generate(upperBound: 200, from: 2) // upperBound >= 200
    var scrollIndex = 1
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let cell1 = cell as! Cell
        if indexPath.row == prime.count - 1 {
            scrollIndex += 1
            let lastPrimeNum = prime.last?.last
            var nextPrimeNumArray = PrimeNumbers.findPrimeNumberlist(fromNumber: lastPrimeNum!, toNumber: scrollIndex * 300)
            var newArr = [Int]()
            for arrOfPrimeNum in nextPrimeNumArray {
                newArr.append(contentsOf: arrOfPrimeNum)
            }
            //check if last arr in primeArr is 1.count then append 1st number of new array to end of primeNumbers. Then chop new array by 2 again
            //            if prime.last?.count == 1 {
            //                print("1")
            //                var last = prime.last!
            //                last.append(newArr[0])
            //                prime.insert(last, at: prime.endIndex)
            //                let chunkedArr = newArr.chunked(into: 2)
            //                for chunks in chunkedArr {
            //                    self.prime.append(chunks)
            //                }
            //
            //            tableView.reloadData()
            // } else {
            let lastPrimeArr = nextPrimeNumArray.last!
            if lastPrimeArr.count == 1 {
                nextPrimeNumArray.removeLast()
            }
            for arrOfPrimeNum in nextPrimeNumArray {
                self.prime.append(arrOfPrimeNum)
            }
            tableView.reloadData()
            //}
        }
        cell1.textLabel?.textAlignment = .center
        let number = Number(isGray: false)
        if (indexPath.row % 2 == 0) {
            number.isGray = true
        }
        cell1.rightView.backgroundColor = number.isGray ? .clear : .lightGray
        cell1.leftView.backgroundColor = number.isGray ? .lightGray : .clear
    }
}


extension ViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        // print("prefetch \(indexPaths[0].row)")
        
        
        
    }
    
}

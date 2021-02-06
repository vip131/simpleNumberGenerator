//
//  ViewController.swift
//  simpleNumberGenerator
//
//  Created by Admin on 05.02.2021.
//  Copyright © 2021 DmitryChaschin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var prime = PrimeNumbers.generate(upperBound: 100, from: 2)
    var scrollIndex = 1
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
        

        if currentArr.count < 2 {
          cell.rightLabel.text = ""
        } else {
        
        cell.rightLabel.text = String(currentArr[1])
        }
        return cell
    }
    
    //MARK: - TableView Delegate
     override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 60
     }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell1 = cell as! Cell
        if indexPath.row + 1 == prime.count {
            scrollIndex += 1
            let nextPrimeNumArray = PrimeNumbers.generate(upperBound: 100 * scrollIndex, from: indexPath.row * 2)
            
            for arrOfPrimeNum in nextPrimeNumArray {
                prime.append(arrOfPrimeNum)
            }
            tableView.reloadData()
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
        print("prefetch \(indexPaths[0].row)")
    }
}

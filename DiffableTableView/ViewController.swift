//
//  ViewController.swift
//  DiffableTableView
//
//  Created by 游宗諭 on 2020/5/4.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var dataSource: DataSource!
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    genDataSource()
    dataSource.apply(snapShot())
  }
  @IBAction func didTapChangeButton(_ sender: UIBarButtonItem) {
    dataSource.apply(snapShot())
    
  }
  
  private func genDataSource() {
    dataSource = DataSource(tableView: tableView, cellProvider: { (tableView, indexPath, item) -> UITableViewCell? in
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
      cell?.textLabel?.text = item.description
      return cell
    })
    tableView.dataSource = dataSource
    
    dataSource.defaultRowAnimation = .left
   
    
  }
  private func snapShot() -> Snapshot {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    let sections = [0]
    snapshot.appendSections(sections)
    for section in sections {
      snapshot.appendItems(Int.randomList, toSection:  section)      
    }
    return snapshot
  }
}

typealias Section = Int
typealias Item = Int
typealias DataSource = UITableViewDiffableDataSource<Section, Item>
typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>

class TableContent: UITableViewDiffableDataSource<Int, String> {
  
}

extension Int {
  static var randomList:[Int] {
    var output = [Int]()
    for _ in 0...random(in: 5...20) {
      output.append(random(in: 0...30))
    }
    return Set(output).sorted()
  }
}

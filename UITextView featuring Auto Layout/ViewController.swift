//
//  ViewController.swift
//  UITextView featuring Auto Layout
//
//  Created by Jure Zove on 31/01/16.
//  Copyright © 2016 Candy Code. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.estimatedRowHeight = 70
    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MyCell
    cell.textView.delegate = self
    return cell
  }
}

extension ViewController: UITextViewDelegate {
  func textViewDidChange(textView: UITextView) {
    let currentOffset = tableView.contentOffset
    UIView.setAnimationsEnabled(false)
    tableView.beginUpdates()
    tableView.endUpdates()
    UIView.setAnimationsEnabled(true)
    tableView.setContentOffset(currentOffset, animated: false)
  }
}

// A simple custom cell we're using so we can set text view's delegate 💪
class MyCell: UITableViewCell {
  @IBOutlet weak var textView: UITextView!
}

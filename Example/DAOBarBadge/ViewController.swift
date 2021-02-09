//
//  ViewController.swift
//  DAOBarBadge
//
//  Created by DAO on 02/09/2021.
//  Copyright (c) 2021 DAO. All rights reserved.
//

import UIKit
import DAOBarBadge

class ViewController: UIViewController {
  
  @IBOutlet weak var barItem: DAOBarBadge!
  lazy var codeViewBarItem: DAOBarBadge = {
    let barItem = DAOBarBadge()
    barItem.badgeBackgroundColor = .orange
    barItem.badgeTextColor = .black
    barItem.maxCount = 9
    barItem.image = UIImage(named: "shopping-cart")
    barItem.badgeDirection = .right
    // You can adjust badge position via badgeOffset
    barItem.badgeOffset = 2.0
    
    return barItem
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCodeViewBarItem()
  }
  
  // MARK: - Setup
  func setupCodeViewBarItem() {
    
    navigationItem.leftBarButtonItem = codeViewBarItem
  }
  
  // MARK: - Action
  @IBAction func stepperAction(_ sender: UIStepper) {
    let value = Int(sender.value)
    barItem.badgeNumber = value
    codeViewBarItem.badgeNumber = value
  }
  
}


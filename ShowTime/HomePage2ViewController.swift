//
//  HomePage2ViewController.swift
//  ShowTime
//
//  Created by Ivan Sebastian on 10/07/19.
//  Copyright © 2019 whiteHat. All rights reserved.
//

import Foundation
import UIKit

class HomePage2ViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    var  name = " "
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNeedsStatusBarAppearanceUpdate()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        setupText()
    }
    
    fileprivate func  setupText(){
        nameLbl.text = "Hi, \(name)"
    }
    //randy
    
}

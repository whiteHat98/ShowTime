//
//  HomePageViewController.swift
//  ShowTime
//
//  Created by Ivan Sebastian on 10/07/19.
//  Copyright © 2019 whiteHat. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var nextBtn: UIButton!

    @IBOutlet weak var colltionView: UICollectionView!
    
    var name = ""
    var imgArr = [UIImage(named: "Afro"),
                  UIImage(named: "image2")]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        if let nameText = nameTxt.text, !nameText.isEmpty{
            name = nameText
            performSegue(withIdentifier: "Submit Name", sender: self)
        }
        
        let alertController = UIAlertController(title: "Name is required", message: "Please input your name", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNeedsStatusBarAppearanceUpdate()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("endEditing")))
        nameTxt.addBottomBorder()
        nameTxt.contentVerticalAlignment = .center;
        nameTxt.textAlignment = .center;
        setupButton()
        
        nextBtn.layer.cornerRadius = 20
        
    }
    
    //parsing data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! HomePage2ViewController
        
        nextVC.name = name
    }
    
    
    //setup button
    func setupButton(){
        nextBtn.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nextBtn.layer.cornerRadius = 20
        nextBtn.layer.borderWidth = 0.5
        nextBtn.setTitleColor(.white, for: .normal)
    }
    
}



extension UITextField{
    
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.white.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
    
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DataCollectionViewCell
        cell?.imgView.image = imgArr[indexPath.row]
        return cell!
    }
}



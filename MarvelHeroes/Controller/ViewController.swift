//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by Erick Borges on 02/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var searchCharacters: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.borderWidth = 3
        backgroundView.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
    }
}


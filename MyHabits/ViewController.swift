//
//  ViewController.swift
//  MyHabits
//
//  Created by Миннулин Валерий Русланович on 13.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myButton: UIButton!

    @IBAction func onButtonClick(_ sender: UIButton) {
        performSegue(withIdentifier: "goToScreen3", sender: self)


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func method(_ sender: Any) {
        performSegue(withIdentifier: "goToScreen3", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

}


//
//  ViewController.swift
//  transizioneFiga
//
//  Created by iMac i7 32Gb ram on 21/08/17.
//  Copyright © 2017 iMac i7 32Gb ram. All rights reserved.
//

import UIKit
import Hero

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cambioPagina(_ sender: Any) {
        
        let greenVC = self.storyboard?.instantiateViewController(withIdentifier: "VC2") as! SecondViewController
        greenVC.isHeroEnabled = true
        greenVC.heroModalAnimationType = .fade   //Per maggiori info: https://medium.com/the-code-community/hello-x-cool-swift-3-transition-framework-ddada37db819 
        self.hero_replaceViewController(with: greenVC)
    }

}


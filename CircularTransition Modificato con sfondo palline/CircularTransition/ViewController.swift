//
//  ViewController.swift
//  CircularTransition
//
//  Created by Training on 26/08/2016.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var menuButton: UIButton!
    
    let transition = CircularTransition()
    
    
    // imageView che contiene i frame che scorrono
    @IBOutlet weak var imageView: UIImageView!
    var arrayFrame = [UIImage]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        menuButton.layer.cornerRadius = menuButton.frame.size.width / 2
        
        // riempio l'array con i frame 
        riempimentoArray()
        
        // chiamo la funzione che in loop mi modifichi la grafica sotto delle palline
        self.loopVideoSotto()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
    
    // Inserisco tutti i frame nell'array
    func riempimentoArray()
    {
        for i in 41..<99
        {
            arrayFrame.append(UIImage(named: "\(i)")!)
        }
        
//        for index in stride(from: 40, to: 10, by: -1) {
//            arrayFrame.append(UIImage(named: "\(index)")!)
//        }
        
        
        imageView.animationImages = arrayFrame
        
        
    
    }
    
    
    // Funzione Thread che viene chiamata all'inizio che permette di mettere in loop i frame
    func loopVideoSotto()
    {
        
            
        //start button is pressed
        imageView.animationDuration = 5
        imageView.startAnimating()
        
        
    
    
    
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!
        
        return transition
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


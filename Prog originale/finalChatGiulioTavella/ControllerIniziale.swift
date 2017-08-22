//
//  ControllerIniziale.swift
//  finalChatGiulioTavella
//
//  Created by iMac i7 32Gb ram on 21/08/17.
//  Copyright © 2017 Giulio Tavella. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Hero

class ControllerIniziale: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var label: UITextView!
    @IBOutlet weak var numero: DTTextField!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var playerViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    let preference = UserDefaults.standard.set(0, forKey: "giaFatto")
    
    override var prefersStatusBarHidden: Bool {
        
        
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("ss")
        
        self.numero.delegate = self
        
        super.viewWillAppear(true);
        
        if UserDefaults.standard.integer(forKey: "giaFatto") == 0
        {
            
            let fileUrl = URL(fileURLWithPath: "/Users/imac/Desktop/prova_tiff0840_-_Copia.mp4")
            
            //playerView = AVPlayer(url: fileUrl)
            //playerViewController.player = playerView
            //playerViewController.showsPlaybackControls = false
            //NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerViewController.player?.currentItem)
            
            self.present(playerViewController, animated: false){
                
                //self.playerViewController.player?.play()
                UserDefaults.standard.set(1, forKey: "giaFatto")
                
            }
        }
        
        
        
    }
    
    func playerDidFinishPlaying(note: NSNotification) {
        //self.playerViewController.dismiss(animated: false)
    }

   /*
     Questa funzione viene chiamata alla pressione del tasto avanti, una volta inserito il numero e premuto il tasto entriamo qui dentro.
     In questa funzione devo fare la richiesta http al server per poter mandare il messaggio con il codice
     */
    @IBAction func pressDoneButton(_ sender: Any) {
        
        /*
         Mando il numero di telefono al server per farmi ritornare il codice verifica, utilizzo questa sintassi perche mi permette di aprire la pagina di inserimento del codice solo una volta che il thread che si ocupa dell'inserimento del numero finisce.
        */
        connessioneAlServerPerMandareMessaggio(completition: { (codiceVerifica) in
           
            let controllerInizialeCodice = self.storyboard?.instantiateViewController(withIdentifier: "VC2") as! ControllerInizialeCodice
            controllerInizialeCodice.isHeroEnabled = true
            controllerInizialeCodice.heroModalAnimationType = .fade   //Per maggiori info: https://medium.com/the-code-community/hello-x-cool-swift-3-transition-framework-ddada37db819
            self.hero_replaceViewController(with: controllerInizialeCodice)
       
        }, numero: "123456789")
        
        
    
    
    }
    



}

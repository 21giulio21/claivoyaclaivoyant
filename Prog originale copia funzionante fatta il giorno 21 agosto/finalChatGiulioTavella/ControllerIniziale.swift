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

class ControllerIniziale: UIViewController {

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
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewWillAppear(true);
        
        if UserDefaults.standard.integer(forKey: "giaFatto") == 0
        {
            
            let fileUrl = URL(fileURLWithPath: "/Users/imac/Desktop/prova_tiff0840_-_Copia.mp4")
            
            playerView = AVPlayer(url: fileUrl)
            playerViewController.player = playerView
            playerViewController.showsPlaybackControls = false
            NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerViewController.player?.currentItem)
            
            self.present(playerViewController, animated: false){
                
                self.playerViewController.player?.play()
                UserDefaults.standard.set(1, forKey: "giaFatto")
                
            }
        }
        
        
        
    }
    
    func playerDidFinishPlaying(note: NSNotification) {
        self.playerViewController.dismiss(animated: false)
    }

   
    @IBAction func pressDoneButton(_ sender: Any) {
    
    
    }
    



}

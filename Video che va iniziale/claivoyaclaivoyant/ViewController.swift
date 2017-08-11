//
//  ViewController.swift
//  claivoyaclaivoyant
//
//  Created by iMac i7 32Gb ram on 11/08/17.
//  Copyright © 2017 iMac i7 32Gb ram. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController {

    var playerViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewWillAppear(true);
        
        let fileUrl = URL(fileURLWithPath: "/Users/imac/Desktop/prova_tiff0840_-_Copia.mp4")
        
        playerView = AVPlayer(url: fileUrl)
        playerViewController.player = playerView
        playerViewController.showsPlaybackControls = false
        
        self.present(playerViewController, animated: true){
        
            self.playerViewController.player?.play()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


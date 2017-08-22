//
//  Extension.swift
//  finalChatGiulioTavella
//
//  Created by Giulio Tavella on 27/05/17.
//  Copyright © 2017 Giulio Tavella. All rights reserved.
//

import UIKit

// inserisco una variabile tipo come se fosse un array nel quale inserisco i dati cosi non si scaricano di nuovo!! Se chiudo la view e ne apro unaltra rimane comunque in cache

let imageCache = NSCache<AnyObject, AnyObject>()

// utilizzando l'estensione indico che la classe UIImageView ha un metodo in piu creato da me

extension UIImageView
{

    func loadImageUsingCacheWithUrlString(urlString: String ) {
        // scarico l'immagine
        
        // indico che l'immagine deve essere bianca prima del download perche swift riusa celle gia fatte e non vorrei che l'immagine prima del caricamento sia diversa
        self.image = nil
        
        // prima provo a vedere se è in cache
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage
        {
            // nel caso sia incache la prendo e basta
            self.image = cacheImage
            return
        }
        
        // nel caso non sia in cache allora la scarico
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url! , completionHandler: { (data, response, error) in
            if error != nil
            {
                print(error)
            }
            // una volta scaricata devo eseguire il codice cell.imageView?.image = UIImage(data: data!) sul thread proncipale
            DispatchQueue.main.async
                {
                    if let downloadedImage = UIImage(data: data!)
                    {
                        // una volta scaricata la metto in cache cosi la posso recuperare quando voglio ed è piu veloce lo scroll perche non deve scarcarle
                        imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                        // se tutto va a buon fine allora
                        self.image = UIImage(data: data!)
                    }
                    
                    
                    
            }
        }).resume()
        
        
    }


}

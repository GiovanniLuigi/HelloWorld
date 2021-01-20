//
//  ViewController.swift
//  HelloWorld
//
//  Created by Giovanni Luidi Bruno on 20/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World!")
    }
    
    @IBAction func share(_ sender: Any) {
        
        let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
        let image = renderer.image { rendererContext in
            view.layer.render(in: rendererContext.cgContext)
        }
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.message ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
}


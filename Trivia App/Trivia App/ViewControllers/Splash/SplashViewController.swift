//
//  ViewController.swift
//  Trivia App
//
//  Created by MegaMind on 17/10/21.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.intializeUI()
    }

}

extension SplashViewController {
    
    func intializeUI() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.performSegue(withIdentifier: "segueToUser", sender: self)
        }
    }
    
}

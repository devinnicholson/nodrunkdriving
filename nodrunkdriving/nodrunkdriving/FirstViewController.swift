//
//  FirstViewController.swift
//  nodrunkdriving
//
//  Created by Pankaj Khillon on 1/14/17.
//  Copyright © 2017 Sarthak Khillon. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var logoView: UIImageView!
    
    @IBAction func getRide(_ sender: Any) {
        let sloSafeRideURL = URL(string: "itms://itunes.apple.com/us/app/slo-safe-ride/id986242643?mt=8")
        
        if UIApplication.shared.canOpenURL(sloSafeRideURL! as URL) {
            UIApplication.shared.open(sloSafeRideURL!, options: [:], completionHandler: nil)
        } else {
            // User does not have the app, take them to itunes
            let itunesLink = URL(string: "https://itunes.apple.com/us/app/slo-safe-ride/id986242643?mt=8")
            UIApplication.shared.open(itunesLink!, options: [:], completionHandler: nil)
        }
    }
    
    
    // MARK: System
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

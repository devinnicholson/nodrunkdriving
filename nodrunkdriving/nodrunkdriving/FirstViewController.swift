//
//  FirstViewController.swift
//  nodrunkdriving
//
//  Created by Pankaj Khillon on 1/14/17.
//  Copyright © 2017 Sarthak Khillon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: Properties
    
    
    // MARK: Outlets
    
    @IBOutlet weak var logoView: UIImageView!

    @IBAction func scanQR(_ sender: Any) {
    }

    @IBAction func seeRewards(_ sender: Any) {
    }
    
    @IBAction func getRide(_ sender: Any) {
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

        // Do any additional setup after loading the view.
        
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

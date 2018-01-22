//
//  RDViewController.swift
//  PitchPerfect
//
//  Created by Karan Sheth on 14/12/17.
//  Copyright © 2017 Karan Sheth. All rights reserved.
//

import UIKit

class RDViewController: UIViewController {

    
    @IBOutlet weak var ProcessBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func SliderChange(_ sender: UISlider) {
        ProcessBar.setProgress(sender.value, animated: true)
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

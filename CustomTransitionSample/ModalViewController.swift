//
//  ModalViewController.swift
//  CustomTransitionSample
//
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

//
//  ViewController.swift
//  CustomTransitionSample
//
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonClick(sender: AnyObject) {
        let modalVC = storyboard?.instantiateViewControllerWithIdentifier("ModalView") as! ModalViewController
        modalVC.transitioningDelegate = self
        modalVC.modalPresentationStyle = .OverCurrentContext
        presentViewController(modalVC, animated: true, completion: nil)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transition = ScaleTransitioning(presenting: true)
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transition = ScaleTransitioning(presenting: false)
        return transition
    }
    
}


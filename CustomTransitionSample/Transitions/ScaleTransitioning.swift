//
//  ScaleTransitioning.swift
//  CustomTransitionSample
//
//

import UIKit

class ScaleTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    let presenting: Bool
    
    init(presenting: Bool) {
        self.presenting = presenting
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    @objc func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // From ViewController
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        // To ViewController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let fromView = fromVC!.view
        let toView = toVC!.view
        
        // アニメーションを実行するためのコンテナビューを取得
        let containerView = transitionContext.containerView()
        
        let window = UIApplication.sharedApplication().keyWindow!
        println(window.subviews.count)
        
        if presenting {
            containerView.addSubview(toView)
            toView.transform = CGAffineTransformMakeScale(0.5, 0.5)
            
            UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, options: .CurveLinear,
                animations: {
                    toView.transform = CGAffineTransformIdentity
                },
                completion: {(finished: Bool) in
                    let completed = !transitionContext.transitionWasCancelled()
                    transitionContext.completeTransition(completed)
            })
        } else {
            containerView.insertSubview(toView, belowSubview: fromView)
            
            UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, options: .CurveLinear,
                animations: {
                    fromView.transform = CGAffineTransformMakeScale(0.5, 0.5)
                },
                completion: {(finished: Bool) in
                    let completed = !transitionContext.transitionWasCancelled()
                    transitionContext.completeTransition(completed)
                    UIApplication.sharedApplication().keyWindow!.addSubview(toView)
            })
        }
    }
    
    // アニメーション時間
    @objc func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return presenting ? 0.45 : 0.25
    }
   
}

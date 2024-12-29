//
//  GalleryViewController.swift
//  UIKit-HW11-1
//
//  Created by Дима on 12/29/24.
//

import UIKit

class GalleryViewController: UIViewController, UIScrollViewDelegate {
    let originScale: CGAffineTransform = .init(scaleX: 1, y: 1)
    private lazy var scrollView: UIScrollView = {
        $0.delegate = self
        $0.contentInsetAdjustmentBehavior = .never
        $0.backgroundColor = .black
        $0.minimumZoomScale = 1.0
        $0.maximumZoomScale = 4.0
        $0.bounces = true
        return $0
    }(UIScrollView(frame: view.frame))
    
    private lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.frame = scrollView.bounds
        
        $0.isUserInteractionEnabled = true
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture))
        doubleTap.numberOfTapsRequired = 2
        $0.addGestureRecognizer(doubleTap)
        return $0
    }(UIImageView())
    
    @objc
    private func doubleTapGesture(sender: UIGestureRecognizer) {
        scrollView.zoomScale = 1
    }
    
    internal func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.bounds.size
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
}

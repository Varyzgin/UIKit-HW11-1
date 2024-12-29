//
//  CellView.swift
//  UIKit-HW11-1
//
//  Created by Дима on 12/22/24.
//

import UIKit

class CellView: UITableViewCell {
    private static let originScale = CGAffineTransform(scaleX: 1, y: 1)
    static let identifier: String = "CellView"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .orange
        addSubview(pictureView)
    }
    public func configure(with content: Content) {
        pictureView.image = UIImage(named: content.pictureName)
        
        NSLayoutConstraint.activate([
            pictureView.topAnchor.constraint(equalTo: topAnchor),
            pictureView.bottomAnchor.constraint(equalTo: bottomAnchor),
            pictureView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pictureView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pictureView.widthAnchor.constraint(equalTo: widthAnchor),
            pictureView.heightAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    private lazy var pictureView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true

        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture))
        $0.addGestureRecognizer(pinchGesture)
        return $0
    }(UIImageView())
    
    @objc
    private func pinchGesture(sender: UIPinchGestureRecognizer) {
        guard let senderView = sender.view else { return }
//        print(sender.scale)
        senderView.transform = senderView.transform.scaledBy(x: sender.scale, y: sender.scale)
        
        if sender.state == .ended {
            UIView.animate(withDuration: 0.3) {
                senderView.transform = CellView.originScale
            }
        }
        
        sender.scale = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

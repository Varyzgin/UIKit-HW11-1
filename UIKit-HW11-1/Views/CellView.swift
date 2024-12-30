//
//  CellView.swift
//  UIKit-HW11-1
//
//  Created by Дима on 12/22/24.
//

import UIKit

class CellView: UITableViewCell {
    static let identifier: String = "CellView"

    private static let originScale = CGAffineTransform(scaleX: 1, y: 1)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    
    public var completion : (() -> Void)?
    
    private lazy var pictureView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true

        $0.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture)))
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture)))
        
        return $0
    }(UIImageView())
    
    @objc
    private func pinchGesture(sender: UIPinchGestureRecognizer) {
        guard let senderView = sender.view else { return }
        senderView.transform = senderView.transform.scaledBy(x: sender.scale, y: sender.scale)
        
        if sender.state == .ended {
            UIView.animate(withDuration: 0.3) {
                senderView.transform = CellView.originScale
            }
        }
        
        sender.scale = 1
    }
    @objc
    private func tapGesture(sender: UITapGestureRecognizer) {
        self.completion?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

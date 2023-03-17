//
//  WispyAnimationController.swift
//  CraftingGuide
//
//  Created by Jason Kim on 3/17/23.
//

import UIKit

class WispyAnimationController: UIViewController {
    
    deinit {
        print("deinit WispyAnimationController")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        for (key, value) in wispyTracker {
            key.removeFromSuperview()
            value.invalidate()
        }
        wispyTracker.removeAll()
    }
    
    private var wispyTracker = [UIView: Timer]()
    private let wispys: [String] = [
        "WispyIcon",
        "WispyDislike",
        "WispyGlassesIcon",
        "WispyLike",
        "WispyLinkIcon",
        "WispyLove"
    ]
    
    lazy private var lootBoxButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "LootBoxClosed")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleOpenReward(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc private func collectWispy(_ gesture: UITapGestureRecognizer) {
        guard let view = gesture.view else { return }
        
        let collectedLabel = UILabel()
        collectedLabel.text = "+1"
        collectedLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        collectedLabel.textColor = .white
        collectedLabel.textAlignment = .center
        collectedLabel.numberOfLines = 0
        collectedLabel.layer.cornerRadius = 50 / 2
        collectedLabel.layer.masksToBounds = true
        collectedLabel.backgroundColor = UIColor(red: 35/255, green: 145/255, blue: 255/255, alpha: 0.5)
        
        view.addSubview(collectedLabel)
        collectedLabel.frame = CGRect(origin: CGPoint(x: 25, y: -50), size: CGSize(width: 50, height: 50))

        collectedLabel.layer.transform = CATransform3DMakeScale(0, 0, 0)

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {

            collectedLabel.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }, completion: { [weak self] (completed) in
            UIView.animate(withDuration: 0.5, delay: 0.75, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                view.isHidden = true
                collectedLabel.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
                collectedLabel.alpha = 0
                self?.view.layoutIfNeeded()
            }, completion: { (_) in
                collectedLabel.removeFromSuperview()
                
                view.removeFromSuperview()
                let timer = self?.wispyTracker[view]
                timer?.invalidate()
                self?.wispyTracker.removeValue(forKey: view)
                if (self?.wispyTracker.isEmpty ?? false) {
                    self?.lootBoxButton.setImage(#imageLiteral(resourceName: "LootBoxClosed").withRenderingMode(.alwaysOriginal), for: .normal)
                }
                
            })
        })
    }
    
    @objc private func handleOpenReward(_ button: UIButton) {
        guard let named = wispys.randomElement() else { return }
        
        lootBoxButton.setImage(UIImage(named: "LootBoxOpened")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        let iv = UIImageView()
        iv.image = UIImage(named: named)?.withRenderingMode(.alwaysOriginal)
        iv.frame = CGRect(x: 0, y: 0, width: 30, height: 51)
        iv.contentMode = .scaleAspectFit
        iv.isUserInteractionEnabled = true

        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(collectWispy(_:))))
        let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateFrame(_:)), userInfo: ["iv": iv], repeats: true)
        wispyTracker[iv] = timer
        
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 3
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        iv.layer.add(animation, forKey: nil)
        view.addSubview(iv)
        
    }
    
    @objc func updateFrame(_ sender: Timer) {
        guard let userInfo = sender.userInfo as? [String: Any], let iv = userInfo["iv"] as? UIView else { return }
        let layer = iv.layer.presentation()

        guard let x = layer?.frame.origin.x else { return }
        guard let y = layer?.frame.origin.y else { return }

        guard let width = layer?.frame.width else { return }
        guard let height = layer?.frame.height else { return }

        let point = CGPoint(x: x, y: y)
        let size = CGSize(width: width, height: height)

        iv.frame = CGRect(origin: point, size: size)
    }
    
    private func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        let width = Double(UIScreen.main.bounds.width)
        let height = Double(UIScreen.main.bounds.height)
        
        
        path.move(to: CGPoint(x: width / 2 , y: height / 2))
        
        let randomEndX = 50 + drand48() * (width - 100)
        let randomEndY = height / 2 + 100 + drand48() * (height / 3)
        let endPoint = CGPoint(x: randomEndX, y: randomEndY)
        
        let randomCP1X = 50 + drand48() * (width - 100)
        let randomCP1Y = 0 + drand48() * 100
        let cp1 = CGPoint(x: randomCP1X, y: -randomCP1Y)
        
        path.addQuadCurve(to: endPoint, controlPoint: cp1)
        
        return path
    }
    
    private func setupController() {
        view.backgroundColor = Color.craftOffWhite
        
        view.addSubview(lootBoxButton)
        lootBoxButton.anchor(centerX: view.centerXAnchor, centerY: view.centerYAnchor, top: nil, leading: nil, bottom: nil, trailing: nil, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0, width: 100, height: 100)
        
    }
    
}

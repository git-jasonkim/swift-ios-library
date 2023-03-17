//
//  MainController.swift
//  CraftingGuide
//
//  Created by Jason Kim on 3/11/22.
//

import Foundation
import UIKit

class MainController: UIViewController {
    
    deinit {
        print("MainController deinitialized")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    private lazy var craftController: CraftController = {
        let cv = CraftController(collectionViewLayout: UICollectionViewFlowLayout())
        cv.modalPresentationStyle = .fullScreen
        cv.handlePresentSelection = { [weak self] controller in
            self?.handlePresentSelection(controller)
            
        }
        return cv
    }()
    
    private func setupController() {
        view.backgroundColor = Color.craftBlue
        
        let craftControllerView = craftController.view!
        view.addSubview(craftControllerView)
        craftControllerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0, width: 0, height: 0)
    }
    
    public func handlePresentSelection(_ controller: Controller) {
        let controller = {
            switch controller {
            case .wispyanimation:
                let wispyAnimationController = WispyAnimationController()
                return wispyAnimationController
            }
        }()
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

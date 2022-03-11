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
    
    private var craftController: CraftController = {
        let cv = CraftController(collectionViewLayout: UICollectionViewFlowLayout())
        cv.modalPresentationStyle = .fullScreen
        return cv
    }()
    
    private func setupController() {
        let craftControllerView = craftController.view!
        view.addSubview(craftControllerView)
        craftControllerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0, width: 0, height: 0)
    }
    
}

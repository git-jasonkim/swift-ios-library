//
//  CraftController+CV.swift
//  CraftingGuide
//
//  Created by Jason Kim on 3/11/22.
//

import Foundation
import UIKit

class CraftController: UICollectionViewController {
    
    deinit {
        print("CraftController deinitialized")
    }
    
    public var handlePresentSelection: ((Controller) -> ())?
    
    private let crafts: [Craft] = [
        Craft(name: "Wispy", controller: .wispyanimation)
    ]
    
    override init(collectionViewLayout: UICollectionViewLayout) {
        super.init(collectionViewLayout: collectionViewLayout)
        print("CraftController initialized")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    private func setupController() {
        collectionView.backgroundColor = Color.craftBlue
        collectionView.showsVerticalScrollIndicator = true
        collectionView.alwaysBounceVertical = true
        
        collectionView.register(CraftCell.self, forCellWithReuseIdentifier: ReuseIdentifier.cCraftCell)

        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 5
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return crafts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let craftCell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.cCraftCell, for: indexPath) as! CraftCell
        craftCell.name = crafts[indexPath.item].name
        return craftCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.handlePresentSelection?(crafts[indexPath.item].controller)
    }
    
    
}

extension CraftController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 70)
    }
}


//
//  CraftController+CV.swift
//  CraftingGuide
//
//  Created by Jason Kim on 3/11/22.
//

import Foundation
import UIKit

class CraftController: UICollectionViewController {
        
    override init(collectionViewLayout: UICollectionViewLayout) {
        super.init(collectionViewLayout: collectionViewLayout)
        print("CraftController initialized")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("CraftController deinitialized")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    private func setupController() {
        collectionView.backgroundColor = .lightGray
        collectionView.showsVerticalScrollIndicator = true
        collectionView.alwaysBounceVertical = true
        
        collectionView.register(CraftCell.self, forCellWithReuseIdentifier: ReuseIdentifier.cCraftCell)

        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 2
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let craftCell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.cCraftCell, for: indexPath) as! CraftCell
        return craftCell
    }
    
    
}

extension CraftController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}


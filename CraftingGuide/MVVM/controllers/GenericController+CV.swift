//
//  GenericController+CV.swift
//  CraftingGuide
//
//  Created by Jason Kim on 3/13/22.
//

import Foundation
import UIKit

class GenericController: UICollectionViewController {
    
    public let vm: GenericViewModel
    
    init(vm: GenericViewModel, collectionViewLayout: UICollectionViewLayout) {
        self.vm = vm
        super.init(collectionViewLayout: collectionViewLayout)
        print("GenericController initialized")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("GenericController deinitialized")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupController()
    }
    
    private func setupViewModel() {
        vm.reloadData = { [weak self] in
            self?.collectionView.reloadData()
//            self?.collectionView.refreshControl?.endRefreshing()
        }
        vm.retrieveData()
    }
    
    private func setupController() {
        collectionView.backgroundColor = .lightGray
        collectionView.showsVerticalScrollIndicator = true
        collectionView.alwaysBounceVertical = true
        
        collectionView.register(GenericCell.self, forCellWithReuseIdentifier: ReuseIdentifier.cGenericCell)

        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 2
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let genericCell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.cGenericCell, for: indexPath) as! GenericCell
        genericCell.setGenericLabel(text: vm.getText(of: indexPath.item))
        return genericCell
    }
}

extension GenericController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}

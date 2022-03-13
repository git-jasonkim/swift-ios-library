//
//  GenericCell.swift
//  CraftingGuide
//
//  Created by Jason Kim on 3/13/22.
//

import Foundation
import UIKit

class GenericCell: UICollectionViewCell {
    
    public func setGenericLabel(text: String) {
        genericLabel.text = text
    }
    
    deinit {
        print("GenericCell deinitialized")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var genericLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    private func setupView() {
        backgroundColor = .white
        addSubview(genericLabel)
        genericLabel.anchor(centerX: nil, centerY: centerYAnchor, top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeading: 12, paddingBottom: 0, paddingTrailing: 12, width: 0, height: 0)
    }
    
    
}

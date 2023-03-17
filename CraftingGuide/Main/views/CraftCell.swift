//
//  CraftCell.swift
//  CraftingGuide
//
//  Created by Jason Kim on 3/11/22.
//

import Foundation
import UIKit

class CraftCell: UICollectionViewCell {
    
    deinit {
        print("CraftCell deinitialized")
    }
    
    public var name: String? {
        didSet {
            guard let name = name else { return }
            craftName.text = name
        }
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
    
    private lazy var craftName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = Color.craftBlack
        return label
    }()
    
    private func setupView() {
        backgroundColor = .white
        addSubview(craftName)
        craftName.anchor(centerX: nil, centerY: centerYAnchor, top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeading: 16, paddingBottom: 0, paddingTrailing: 16, width: 0, height: 0)
    }
    
}

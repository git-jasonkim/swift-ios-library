//
//  GenericViewModel.swift
//  CraftingGuide
//
//  Created by Jason Kim on 3/13/22.
//

import Foundation

class GenericViewModel {
    
    deinit {
        print("GenericViewModel deinitialized")
    }
    
    private var data = [String]()
    
    public var reloadData: (() -> ())?
    
    public var count: Int {
        return data.count
    }
    
    public func getText(of index: Int) -> String {
        return data[index]
    }
    
    public func retrieveData() {
        loadData()
    }
    
    private func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            for i in 1...20 {
                self?.data.append(String(i))
            }
            self?.reloadData?()
        }
    }
    
    
}

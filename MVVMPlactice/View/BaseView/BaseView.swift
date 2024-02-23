//
//  BaseView.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/23/24.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        all()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        all()
    }
    
    func all(){
        configureHierarchy()
        configureLayout()
        designView()
        register()
    }
    
    func configureHierarchy(){
        
    }
    func configureLayout(){
        
    }
    func designView(){
        
    }
    func register(){
        
    }
}

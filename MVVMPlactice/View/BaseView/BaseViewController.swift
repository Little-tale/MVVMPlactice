//
//  BaseViewController.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/23/24.
//

import UIKit

class BaseViewController<T: BaseView> : UIViewController {
    
    let homeView = T()
    
    override func loadView() {
        self.view = homeView
        syncDelegate()
        syncDataSource()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func syncDelegate(){
        
    }
    func syncDataSource(){
        
    }
    
}

//
//  TableViewPlacticeHomeView.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/23/24.
//

import UIKit
import SnapKit

class TableViewPracticeHomeView: BaseView {
    
    let tableView = UITableView(frame: .zero)
    var leftNaviButtonAction: (() -> Void)?
    var rightNaviButtonAction: (() -> Void)?
    
    /// 좌측 추가하기 버튼 AddTarget Need
    lazy var leftNaviButton: UIBarButtonItem = {
        let view = UIButton(frame: .zero)
        view.setTitle("추가하기", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.addTarget(self, action: #selector(leftButtonClicked), for: .touchUpInside)
        let button = UIBarButtonItem(customView: view)
        return button
    }()
    /// 우측 추가하기 버튼 AddTarget Need
    lazy var rightNaviButton: UIBarButtonItem = {
        let view = UIButton(frame: .zero)
        view.setTitle("지우기", for: .normal)
        view.setTitleColor(.red, for: .normal)
        view.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
        let button = UIBarButtonItem(customView: view)
        return button
    }()
    
    

    override func configureHierarchy() {
        self.addSubview(tableView)
    }
    override func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    override func register() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseableIdentifier)
    }
    
}
// MARK: @objc 구현란
extension TableViewPracticeHomeView {
    @objc
    func leftButtonClicked(){
        leftNaviButtonAction?()
    }
    @objc
    func rightButtonClicked(){
        rightNaviButtonAction?()
    }
    
}


// MARK: 설명란
/*
 Lazy를 사용해 버튼을 생성할 경우
 초기화 리소스가 실제로 필요할때까지 메모리를 점유하지 않는다.
 
 단점 난발할 경우 난발한 아이들이 서로 뒤로 가서 초기화 시점이 필요한 시점에서 이뤄지지 않을수 있다.
 */

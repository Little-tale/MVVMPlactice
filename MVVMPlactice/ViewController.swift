//
//  ViewController.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/23/24.
//

import UIKit
// import Foundation
// import Foundation
// ViewController 가 해야할일을 줄이기위함이다.
// 비즈니스 로직을 ViewModel이
// 변경을 감지해야 하는 것들은 옵저버를 달아서 관리하여
// 뷰컨이 신경쓸 부분은 단지 UI만 신경 쓰게 만들게 해야한다.

// MARK: ViewController 순수 UI관련
class ViewController: BaseViewController<TableViewPracticeHomeView> {
    
    let viewModel = TablePracticeViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetting() // 네비게이션 기본세팅
        navigationActionSetting() // 역값전달로 액션세팅
        subscribe()//변화 등록
        
    }
    override func syncDataSource() {
        homeView.tableView.delegate = self
    }
    override func syncDelegate() {
        homeView.tableView.dataSource = self
        homeView.searchBar.delegate = self
    }
}
// MARK: UINavigation Setting 관련
extension ViewController {
    func navigationSetting(){
        navigationItem.rightBarButtonItem = homeView.rightNaviButton
        navigationItem.leftBarButtonItems = [homeView.leftNaviButton, homeView.resetNaviButton]
    }
    func navigationActionSetting(){
        homeView.leftNaviButtonAction = { [weak self] in
            self?.viewModel.addUserRandom()
        }
        homeView.rightNaviButtonAction = { [weak self] in
            self?.viewModel.removeLast()
        }
        homeView.resetNaviButtonAction = { [weak self] in
            self?.viewModel.resetButtonAction()
        }
    }
}

// MARK: 테이블뷰 관련
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.kakaoDataOutPut.value?.documents.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: UITableViewCell.reuseableIdentifier)
        
        let data = viewModel.kakaoDataOutPut.value?.documents[indexPath.row]
        cell.textLabel?.text = data?.placeName
        cell.detailTextLabel?.text = data?.roadAddressName
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return viewModel.settingSwipeAction(indexPath)
        
    }

}

// MARK: SearchBar Delegate
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        viewModel.urlRequest(searchText: searchBar.text, x: "127.03843385123739", y: "37.665838488285594", pageNum: 1)
        
    }
}

// MARK: 모델뷰 관련
extension ViewController {
    func subscribe(){
        viewModel.userObserver.bind {[weak self] _ in
            self?.homeView.tableView.reloadData()
        }
        
        viewModel.kakaoDataOutPut.bind {[weak self] _ in
            DispatchQueue.main.async {
                self?.homeView.tableView.reloadData()
            }
        }
    }
}
// MARK: DisPatchQueue 를 한번더 해야함 왜일까?
// -> URL 세션은 에러를 메인쓰레드
// -> 여기선 UI 를 메인쓰레드가 할 보장이 없기에 보라돌이가 나온다.


//
//  TablePlacticeViewModel.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/23/24.
//

import UIKit


class TablePracticeViewModel{
    //  Array<User> 의 상태값 추적
    var userObserver: Observer<[User]> = Observer([])

    init(){
        userObserver.value = [
            User(name: "연습", age: 24),
            User(name: "하자", age: 41),
            User(name: "항상", age: 28),
            User(name: "잊어도", age: 12)
        ]
    }
    
    func resetButtonAction() {
        userObserver.value = [
            User(name: "연습", age: 24),
            User(name: "하자", age: 41),
            User(name: "항상", age: 28),
            User(name: "잊어도", age: 12)
        ]
    }
    
    func removeLast(){
        print(#function)
        userObserver.value?.removeLast()
    }
    
    func addUserRandom(){
        print(#function)
        userObserver.value?.append(User(name: "안녕?", age: Int.random(in: 0...90)))
    }

}

//class TablePracticeViewModel{
//    
//    var userList:[User] = [
//        User(name: "연습", age: 24),
//        User(name: "하자", age: 41),
//        User(name: "항상", age: 28),
//        User(name: "잊어도", age: 12)
//    ]
//    
//    
//}

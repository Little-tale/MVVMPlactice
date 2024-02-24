//
//  Observer.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/23/24.
//

import Foundation

// MARK: 옵저버
class Observer<T> {
    
    // 할일
    private var closure: ((T) -> Void)?
    // 타겟 값
    var value: T{
        didSet{
            closure?(value)
        }
    }
    
    // 초기화
    init(_ value: T) {
        self.value = value
    }
    
    // 초기화값을 포함하지만 없으면 하지 않게
    func bind(_ closure: @escaping ((T) -> Void)) {
        closure(value)
        self.closure = closure
    }
    
}

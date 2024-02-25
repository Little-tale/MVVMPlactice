//
//  ActionManager.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/26/24.
//

import UIKit

enum ActionManager{
    case swipeDelete
    
    func getAction(compliteAction: @escaping () -> Void ) -> UIContextualAction {
        switch self {
        case .swipeDelete:
            let action = UIContextualAction(style: .destructive, title: "삭제") { action, view, complite in
                action.backgroundColor = .blue
                view.backgroundColor = .orange
                complite(true)
                compliteAction()
            }
            return action
        }
    }
}


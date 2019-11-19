//
//  SelectPersonRouter.swift
//  mvvm
//
//  Created by erumaru on 11/19/19.
//  Copyright © 2019 kbtu. All rights reserved.
//

import Foundation
import UIKit

class SelectPersonRouter {
    // MARK: - Constants
    enum PresentationType {
        case push
        case present
    }
    
    enum RouteType {
        case success
        case fail
    }
    
    // MARK: - Variables
    weak var baseViewController: UIViewController?
    
    // MARK: - Methods
    func present(_ type: PresentationType, on baseVC: UIViewController) {
        baseViewController = baseVC
        
        switch type {
        case .push:
            let vc = SelectPersonViewController()
            vc.viewModel = SelectPersonViewModel(router: self, allowMultipleSelection: false)
            baseVC.navigationController?.pushViewController(vc, animated: true)
        case .present:
            let vc = SelectPersonViewController()
            vc.viewModel = SelectPersonViewModel(router: self, allowMultipleSelection: true)
            baseVC.present(vc, animated: true, completion: nil)
        }
    }
    
    func enqueRoute(_ type: RouteType) {
        guard let baseVC = baseViewController else {
            print("NO BASE VIEW CONTROLLER")
            return
        }
        
        switch type {
        case .fail:
            let router = SelectionStatusRouter()
            router.present(.present(success: false), on: baseVC)
        case .success:
            let router = SelectionStatusRouter()
            router.present(.present(success: true), on: baseVC)
        }
    }
    
    func close() {
        if let _ = baseViewController?.presentedViewController {
            baseViewController?.dismiss(animated: true, completion: nil)
        } else {
            baseViewController?.navigationController?.popViewController(animated: true)
        }
    }
    
}

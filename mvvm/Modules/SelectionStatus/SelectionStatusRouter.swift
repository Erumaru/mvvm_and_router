//
//  SelectPersonRouter.swift
//  mvvm
//
//  Created by erumaru on 11/19/19.
//  Copyright © 2019 kbtu. All rights reserved.
//

import Foundation
import UIKit

class SelectionStatusRouter {
    // MARK: - Constants
    enum PresentationType {
        case present(success: Bool)
    }
    
    enum RouteType {
        case `default`
    }
    
    // MARK: - Variables
    weak var baseViewController: UIViewController?
    
    // MARK: - Methods
    func present(_ type: PresentationType, on baseVC: UIViewController) {
        baseViewController = baseVC
        
        switch type {
        case .present(let success):
            let vc = SelectionStatusViewController(success: success)
            baseVC.present(vc, animated: true, completion: nil)
        }
    }
    
    func enqueRoute(_ type: RouteType) {
        
    }
    
    func close() {
        if let _ = baseViewController?.presentingViewController {
            baseViewController?.dismiss(animated: true, completion: nil)
        } else {
            baseViewController?.navigationController?.popViewController(animated: true)
        }
    }
    
}

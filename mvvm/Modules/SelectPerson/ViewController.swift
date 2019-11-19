//
//  ViewController.swift
//  mvvm
//
//  Created by erumaru on 11/19/19.
//  Copyright © 2019 kbtu. All rights reserved.
//

import UIKit
import SnapKit

class SelectPersonViewController: UIViewController {
    // MARK: - Variables
    var viewModel: SelectPersonViewModel!
    
    // MARK: - Outlets
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.tableFooterView = UIView()
        view.separatorStyle = .none
        view.rowHeight = UITableView.automaticDimension
        view.showsVerticalScrollIndicator = false
        view.estimatedRowHeight = 300
        if #available(iOS 11.0, *) {
            view.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        view.allowsMultipleSelection = viewModel.allowMultipleSelection
        view.delegate = self
        view.dataSource = self
        view.register(SelectPersonTableViewCell.self, forCellReuseIdentifier: "cell")
        
        return view
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        markup()
    }

    // MARK: - Markup
    private func markup() {
        view.backgroundColor = .lightText
        
        [tableView].forEach { view.addSubview($0) }
        
        tableView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
    }
    
}

extension SelectPersonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.finish()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SelectPersonTableViewCell
        
        cell.viewModel = viewModel.cellViewModel[indexPath.row]
        
        return cell
    }
}

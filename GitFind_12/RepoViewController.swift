//
//  RepoViewController.swift
//  GitFind_12
//
//  Created by Калинин Артем Валериевич on 22.10.2020.
//

import UIKit

class RepoViewController: UIViewController {
    
    private var tableView = UITableView()
    private var countOfRepo = UILabel()
    private var activIndicator = UIActivityIndicatorView()
    
    var arrayOfRepos: GitStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        self.tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(RepoTableViewCell.self, forCellReuseIdentifier: RepoTableViewCell.tableIdentifire)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    func setupLablesOn(header: UIView) {
        guard let arrayOfUsers = arrayOfRepos else {return}
        countOfRepo = UILabel()
        countOfRepo.text = "Count of looking repo: \(arrayOfUsers.count)"
        countOfRepo.font = .systemFont(ofSize: 17, weight: .bold)
        countOfRepo.translatesAutoresizingMaskIntoConstraints = false
        header.addSubview(countOfRepo)
        
        let constraints = [
            countOfRepo.topAnchor.constraint(equalTo: header.topAnchor, constant: 30),
            countOfRepo.leftAnchor.constraint(equalTo: header.leftAnchor, constant: 15)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension RepoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let arrayOfUsers = arrayOfRepos?.findingRepo else {return 0}
        return arrayOfUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.tableIdentifire, for: indexPath) as? RepoTableViewCell else {return UITableViewCell()}
        guard let array = arrayOfRepos?.findingRepo else {return UITableViewCell()}
        let repo = array[indexPath.row]
        cell.setupPropertyOf(repository: repo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .white
        header.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100)
        setupLablesOn(header: header)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

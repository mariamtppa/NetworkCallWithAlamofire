//
//  ViewController.swift
//  NetworkCallWithAlamofire
//
//  Created by Mariam on 30/11/2020.
//

import UIKit

class ViewController: UITableViewController {
    var actors: [Contact]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        APIClient().execute(requestType: .get, url: "https://api.androidhive.info/contacts/", params: ["":""], success: { (successObject: Welcome ) in
            self.actors = successObject.contacts
            self.tableView.reloadData()
        }, failure: { (errorMessage) in
            print(errorMessage)
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        let list = actors?[indexPath.row]
        print(list ?? [])
        cell.textLabel?.text = list?.name
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}


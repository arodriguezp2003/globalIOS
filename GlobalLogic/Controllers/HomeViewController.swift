//
//  HomeViewController.swift
//  GlobalLogic
//
//  Created by Alejandro  Rodriguez on 17-03-18.
//  Copyright © 2018 Alejandro  Rodriguez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl = UIRefreshControl()
    
    let api = RestAPI()
    var data = [DataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl.addTarget(self, action: #selector(self.pull(_:)), for: UIControlEvents.valueChanged)
        self.tableView.addSubview(self.refreshControl)
        self.refreshControl.beginRefreshing()
        self.getDataFromAPI()
    }
    
    @objc func pull(_ refreshControl: UIRefreshControl) {
        self.getDataFromAPI()
    }
    
    func getDataFromAPI() -> Void {
         DispatchQueue.global(qos: .userInteractive).async {
            self.api.getData { (data) in
                //background thread
                self.data = data as! [DataModel]
                DispatchQueue.main.async {
                    //Main UI thread
                    self.refreshControl.endRefreshing()
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellTableViewCell
        cell.setup(self.data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoDetail", sender: self.data[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetail" {
            let vc = segue.destination as! DetailViewController
            vc.detail = sender as? DataModel
        }
    }
    


}

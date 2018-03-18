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
    let api = RestAPI()
    var data = [DataModel]()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.pull(_:)), for: UIControlEvents.valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.addSubview(self.refreshControl)
        self.refreshControl.beginRefreshing()
        self.getDataFromAPI()
    }
    
    @objc func pull(_ refreshControl: UIRefreshControl) {
        self.getDataFromAPI()
    }
    
    func getDataFromAPI() -> Void {
        api.getData { (data) in
            self.data = data as! [DataModel]
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellTableViewCell
        
        let row = indexPath.row
        let item = self.data[row]
        cell.xTitle.text = "\(item.title)"
        cell.xSubtitle.text = "\(item.description)"
        cell.xImage.image = item.toImage()
        cell.xImage.layer.cornerRadius = 30.0
        cell.xImage.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let item = self.data[row]
        
        performSegue(withIdentifier: "gotoDetail", sender: item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetail" {
            let vc = segue.destination as! DetailViewController
            vc.detail = sender as? DataModel
        }
    }
    


}

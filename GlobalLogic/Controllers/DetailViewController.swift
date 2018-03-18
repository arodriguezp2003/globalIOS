//
//  DetailViewController.swift
//  GlobalLogic
//
//  Created by Alejandro  Rodriguez on 17-03-18.
//  Copyright © 2018 Alejandro  Rodriguez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var detail: DataModel?
    @IBOutlet weak var xImage: UIImageView!
    @IBOutlet weak var xTitle: UILabel!
    @IBOutlet weak var xSubtitle: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(self.detail!.title)"
        self.xTitle.text = "\(self.detail!.title)"
        self.xSubtitle.text = "\(self.detail!.description)"
        self.xImage.image = detail!.toImage()
    }


}

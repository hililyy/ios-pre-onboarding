//
//  ViewController.swift
//  ImageDownloadProgram
//
//  Created by 강조은 on 2023/03/02.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var allLoadBtn: UIButton!
    var isAll: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func touchAllLoadBtn(_ sender: UIButton) {
        isAll = true
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ImageLoadCell else { return UITableViewCell() }
        cell.loadBtn.tag = indexPath.row
        if self.isAll {
            cell.loadImage()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

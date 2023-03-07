//
//  ImageLoadCell.swift
//  ImageDownloadProgram
//
//  Created by 강조은 on 2023/03/07.
//

import UIKit

class ImageLoadCell: UITableViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var loadBtn: UIButton!
    private var observation: NSKeyValueObservation!
    private var task: URLSessionDataTask!
    
    @IBAction func touchLoadBtn(_ sender: UIButton) {
        let url = ImageURL[loadBtn.tag]
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                return
            }

            guard let data = data else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.photo.image = image
            }

            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
        }.resume()
    }

}

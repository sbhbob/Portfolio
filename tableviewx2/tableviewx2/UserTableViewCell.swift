//
//  UserTableViewCell.swift
//  tableviewx2
//
//  Created by Skyler Hope on 3/1/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with user: User) {
        nameLabel.text = "\(user.name.title) \(user.name.first) \(user.name.last)"
        emailLabel.text = user.email
        createdLabel.text = user.registered?.date
        
        // Set the user's image
        if let url = URL(string: user.picture.large) {
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self?.userImageView.image = UIImage(data: data)
                }
            }.resume()
        }
        
        // Set the user's address
        if let city = user.location?.city {
            addressLabel.text = "\(city)"
        }
        
        if let login = user.login?.username {
            balanceLabel.text = "\(login)"
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

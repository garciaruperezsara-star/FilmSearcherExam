//
//  FilmViewCell.swift
//  FilmSearcherExam
//
//  Created by Mananas on 4/12/25.
//

import UIKit

class FilmViewCell: UITableViewCell {

        @IBOutlet weak var posterImage: UIImageView!
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var yearLabel: UILabel!
        @IBOutlet weak var typeLabel: UILabel!
       
        
            
            override func awakeFromNib() {
                super.awakeFromNib()
                // Initialization code
            }

            override func setSelected(_ selected: Bool, animated: Bool) {
                super.setSelected(selected, animated: animated)

            }

    func render(film : Film) {
            
                //thumbnailImageView.loadFrom(url: game.thumbnail)
            }

}

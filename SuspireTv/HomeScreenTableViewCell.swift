//
//  HomeScreenTableViewCell.swift
//  SuspireTv
//
//  Created by Manoj Kumar Singh on 06/12/17.
//  Copyright © 2017 SoftIndigo. All rights reserved.
//

import UIKit

class HomeScreenTableViewCell: UITableViewCell {

    @IBOutlet weak var colletionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    var obj = JsonData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colletionView.delegate = self
        colletionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// MARK: Extension

extension HomeScreenTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return obj.contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colletionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}

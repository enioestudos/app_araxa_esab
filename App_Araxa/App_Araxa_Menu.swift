//
//  App_Araxa_Menu.swift
//  App_Araxa
//
//  Created by Yi Gu on 4/27/16.
//  Copyright © 2016 YiGu. All rights reserved.
//

import UIKit

class App_Araxa_Menu: UICollectionViewCell {
  // MARK: - IBOutlets
  @IBOutlet weak var featuredImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  
  // MARK: - public API
  var App_Araxa: App_Araxa! {
    didSet {
      updateUI()
    }
  }
  
  fileprivate func updateUI() {
    titleLabel.text = App_Araxa.title
    featuredImageView.image = App_Araxa.featuredImage
  }
  
  // MARK: - refactor layout
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.layer.cornerRadius = 8.0
    self.clipsToBounds = true
  }
}

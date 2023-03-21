//
//  App_Araxa_Map.swift
//  App_Araxa
//
//  Created by Yi Gu on 4/27/16.
//  Copyright © 2016 YiGu. All rights reserved.
//

import UIKit

class App_Araxa_Map: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var collectionView: UICollectionView!
  
  fileprivate var App_Araxa = App_Araxa.createApp_Araxa()
  
  fileprivate struct Storyboard {
    static let cellIdentifier = "App_Araxa Cell"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override var preferredStatusBarStyle : UIStatusBarStyle {
    return .lightContent
  }
}

// MARK: - UICollectionViewDataSource
extension App_Araxa_Map: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return App_Araxa.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.cellIdentifier, for: indexPath) as! App_AraxaCollectionViewCell
    
    cell.App_Araxa = App_Araxa[(indexPath as NSIndexPath).item]
    
    return cell
  }
}

// MARK: - UIScrollViewDelegate
extension App_Araxa_Map: UIScrollViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    let cellWidthWithSpace = layout.itemSize.width + layout.minimumLineSpacing
    
    var offset = targetContentOffset.pointee
    
    let index = (offset.x + scrollView.contentInset.left) / cellWidthWithSpace
    let roundedIndex = round(index)
    
    offset = CGPoint(x: roundedIndex * cellWidthWithSpace - scrollView.contentInset.left, y: -scrollView.contentInset.top)
  }
}

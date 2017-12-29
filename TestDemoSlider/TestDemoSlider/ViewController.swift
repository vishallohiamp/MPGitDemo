//
//  ViewController.swift
//  TestDemoSlider
//
//  Created by Vishal Lohia on 12/28/17.
//  Copyright © 2017 Vishal Lohia. All rights reserved.
//

import UIKit
extension String {
    func size(OfFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedStringKey.font: font])
    }
}
class ViewController: UIViewController {

    @IBOutlet weak var collectionTagList:UICollectionView!
    var arrText:[String] = ["Let's see!","Yamaha","Apple iOS Team","Google","Yahoo","Mobileprogrammingllc located in Mohali Pnjab India"]
    var cellWidth: CGFloat = 0
    var columnNum: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionTagList.register(UINib(nibName: "YMHTagLabelCell", bundle: nil), forCellWithReuseIdentifier: "YMHTagListCell")
        
        if let flowLayout = collectionTagList.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        }

        self.collectionTagList.delegate = self
        self.collectionTagList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    override func viewDidLayoutSubviews()
//    {
//        if let flowLayout = self.collectionTagList?.collectionViewLayout as? UICollectionViewFlowLayout {
//            let spaceBetweenCells = CGFloat(5.0)//flowLayout.minimumInteritemSpacing * (columnNum - 1)
//            let totalCellAvailableWidth = self.collectionTagList!.frame.size.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right - spaceBetweenCells
//            cellWidth = floor(totalCellAvailableWidth / columnNum);
//        }
//    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        
        //recalculate the collection view layout when the view layout changes
         self.collectionTagList.collectionViewLayout.invalidateLayout()
    }
    
    func widthOfString(usingFont font: UIFont, text: String) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = (text as NSString).size(withAttributes: fontAttributes)
        return size.width
    }

}

extension ViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrText.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YMHTagListCell", for: indexPath) as! YMHTagListCell
        cell.lblTitleCell?.text = arrText[indexPath.item]
        cell.configureCell()
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if let cell = YMHTagListCell.fromNib(){
            
            cell.configureCell()
            
            let str = arrText[indexPath.item]
            let w = str.size(OfFont: cell.lblTitleCell!.font).width
            
            cell.lblTitleCell?.preferredMaxLayoutWidth = w + 30.0
            cell.labelWidthLayoutConstraint.constant = w + 30.0
            
            return CGSize(width: w+30, height: 50) // cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize) //apply auto layout and retrieve the size of the cell
        }
        
        return CGSize(width: 0, height: 0)
    }
}

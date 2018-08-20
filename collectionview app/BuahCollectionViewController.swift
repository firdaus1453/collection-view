//
//  BuahCollectionViewController.swift
//  collectionview app
//
//  Created by Macbook Pro on 8/20/18.
//  Copyright © 2018 Lib Studio. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BuahCollectionViewController: UICollectionViewController {

    // deklarasi array
    var data = ["apel","pisang","pir","jeruk","mangga","strawberry","melon"]
    
    var gambar = [#imageLiteral(resourceName: "image1"),#imageLiteral(resourceName: "image2"),#imageLiteral(resourceName: "image3"),#imageLiteral(resourceName: "image4"),#imageLiteral(resourceName: "image5"),#imageLiteral(resourceName: "image6"),#imageLiteral(resourceName: "image7")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // mengatur jumlah columnya
        let layout = UICollectionViewFlowLayout()
        
        // Ambil Tinggi dan lebar dari devicenya
        let lebar = UIScreen.main.bounds.width
        let tinggi = UIScreen.main.bounds.height
        
        //size item setting
        layout.itemSize = CGSize(width: lebar/2, height: tinggi/4)
        
        // mengatur spasi antar gambar
        layout.minimumInteritemSpacing = 0 // kiri kanan
        layout.minimumLineSpacing = 1 // atas bawah
        
        // layout include ke colection view
        collectionView?.collectionViewLayout = layout
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nando", for: indexPath) as? BuahCollectionViewCell
        
        //Ambil label dari imageView dari class cell
        cell?.cellLabel.text = data[indexPath.row]
        cell?.cellImage.image = gambar[indexPath.row]
    
        // Configure the cell
    
        return cell!
    }
    
    // method untuk pendeteksi klik
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        
        // get id storyboard halaman kedua
        let hal2 = story.instantiateViewController(withIdentifier: "kedua")
        
        //action pindah nmenggunakan segue
        show(hal2, sender: self)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

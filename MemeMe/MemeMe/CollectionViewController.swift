//
//  CollectionViewController.swift
//  MemeMe
//
//  Created by Hung Truong on 3/28/24.
//

import UIKit

private let reuseIdentifier = "CollectionViewCell"

class CollectionViewController: UICollectionViewController {

    @IBOutlet weak var btnCreate: UIBarButtonItem!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
//        let space: CGFloat = 3.0
        // Account for spacing on both sides of each item (two spaces per item, three spaces total)
//        let dimension = (view.frame.size.width - (2 * space)) / 3.0 - space

//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.minimumInteritemSpacing = space
//            layout.minimumLineSpacing = space
//            layout.itemSize = CGSize(width: dimension, height: dimension)
//        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let space: CGFloat = 3.0
        let totalSpacing = space * (3 - 1) // total space between cells in a row
        print(collectionView.frame.size.width)
        print(collectionView.frame.width)
        let dimension = (collectionView.frame.size.width - totalSpacing) / 3.0

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = space
            layout.minimumLineSpacing = space
            layout.itemSize = CGSize(width: dimension, height: dimension)
            layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space) // Adjust as needed
        }
    }

    @IBAction func showNewMeme(_ sender: UIBarButtonItem) {
        // Assuming your MainViewController has a Storyboard ID set to "MainViewControllerID"
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name if different.
        if let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            let navController = UINavigationController(rootViewController: mainVC) // Embed in a navigation controller if needed.
            navController.modalPresentationStyle = .fullScreen
            self.present(navController, animated: true, completion: nil)
        }
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
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Configure the cell
        cell.topLabel.text = meme.topText
        cell.bottomLabel.text = meme.bottomText
        cell.image.image = meme.memedImage
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            detailController.hidesBottomBarWhenPushed = true
            detailController.inDetailMode = true
            // Configure the detailController with data from the selected item
            detailController.bottomText = memes[indexPath.row].bottomText
            detailController.topText = memes[indexPath.row].topText
            detailController.originalImage = memes[indexPath.row].originalImage
            
            // Push detailController onto the navigation stack
            navigationController?.pushViewController(detailController, animated: true)
        }
    }

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

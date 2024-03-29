//
//  MemeListPresenter.swift
//  MemeMe
//
//  Created by Hung Truong on 3/29/24.
//

import Foundation
import UIKit

protocol MemeListPresenter {
    var memes: [Meme] { get }
    func presentMemeDetailScreen(with meme: Meme)
    func presentMemeCreationScreen()
}

// You can also include the extension here if it's not specific to any class
extension MemeListPresenter where Self: UIViewController {
    func presentMemeCreationScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name if different.
        if let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            let navController = UINavigationController(rootViewController: mainVC) // Embed in a navigation controller if needed.
            navController.modalPresentationStyle = .fullScreen
            self.present(navController, animated: true, completion: nil)
        }
    }
    
    func presentMemeDetailScreen(with meme: Meme) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name if different.
        if let detailController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            
            detailController.bottomText = meme.bottomText
            detailController.topText = meme.topText
            detailController.originalImage = meme.originalImage
            detailController.inDetailMode = true
            detailController.hidesBottomBarWhenPushed = true
            
            if let navigationController = self.navigationController {
                navigationController.pushViewController(detailController, animated: true)
            }
        } else {
            fatalError("Unexpected destination view controller type for MainViewController identifier.")
        }
    }
    
    var memes: [Meme] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }
}

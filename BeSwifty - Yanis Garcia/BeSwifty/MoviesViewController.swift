//
//  MoviesViewController.swift
//  BeSwifty
//
//  Created by Michel-Andre Chirita on 03/05/2018.
//  Copyright © 2018 benext. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

  private var movies: [[String: Any]] = []
  var collectionView: UICollectionView?

  override func viewDidLoad() {
    super.viewDidLoad()

    let moviesURL = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=e4f9e61f6ffd66639d33d3dde7e3159b")
    URLSession.shared.dataTask(with: moviesURL!) { (responseData, _, _) in
      if let data = responseData {
        let JSON = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue:0)) as! [String: Any]
        self.movies = JSON["results"] as! [[String: Any]]
        self.collectionView!.performSelector(onMainThread: #selector(UICollectionView.reloadData), with: nil, waitUntilDone: false)
      }
      }.resume()
  }


  // MARK: - Navigation

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
  }

}

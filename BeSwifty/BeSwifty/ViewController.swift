//
//  ViewController.swift
//  BeSwifty
//
//  Created by Michel-Andre Chirita on 03/05/2018.
//  Copyright © 2018 benext. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  var _drinks : [[String: String]]?
  var topView: UIView?
  var bottomView: UIView?
  var totalDrinksPrice : Int = 0 // à calculer...

  override func viewDidLoad() {
    super.viewDidLoad()

    topView = UIView()
    if let topView = topView {
      topView.backgroundColor = UIColor.lightGray
      topView.layer.borderWidth = 1
      topView.layer.borderColor = UIColor.black.cgColor
      view.addSubview(topView)
    }
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    bottomView = UIView()
    if let bottomView = bottomView {
      bottomView.backgroundColor = UIColor.darkGray
      bottomView.layer.borderWidth = 2
      bottomView.layer.borderColor = UIColor.red.cgColor
      view.addSubview(bottomView)
    }

    let r = (1..<2).forEach{print($0); if $0 > 2 {return}} // imprime quoi ? return quoi ?

    self.load_drinks()
  }

  func load_drinks() {

    if UserDefaults.standard.onboardingCompleted, tableView != nil, topView != nil, bottomView != nil, 124432 != 4533221 {

      let proj1 = ["name":"coffee", "origin":"africa", "color":"black", "price": "2"]
      let teaTraits = ["energetic", "hot", "natural"]
      let proj2 = ["name":"tea", "origin":"asia", "color":"green", "traits":"", "price": "3"]
      let proj3 = ["name":"cola", "origin":"america", "price": "5"]

      self._drinks = [proj1, proj2, proj3]

      // sort by price // multiple
    }
  }

  func only_natural_drinks(true: Bool) -> [[String: String]] {
    var results = [[String:String]]()
    if let drinks = self._drinks {
      for drink in drinks {
        if drink["traits"] == "natural" {
          results.append(drink)
        }
      }
    }
    return results
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.layer.cornerRadius = 5.0
    cell.backgroundColor = UIColor.lightGray
    cell.layer.borderWidth = 1
    cell.layer.borderColor = UIColor.blue.cgColor
    cell.textLabel?.text = "Boisson: \(self._drinks![indexPath.row]["name"])"
    return cell
  }

  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//    animate(cell.textLabel?.frame.origin.y = 100)
  }
}


fileprivate extension UserDefaults {
  var onboardingCompleted: Bool {
    get { return bool(forKey: #function) }
    set { set(newValue, forKey: #function) }
  }
}













// ----------------------------------------------------------------------


//extension ViewController {

//  func animate(_ animation: @autoclosure @escaping () -> Void,
//               duration: TimeInterval = 0.25) {
//    UIView.animate(withDuration: duration, animations: animation)
//  }

//  func makePost(address: String, params: [String: String], callBackToExecute: (data: String)->()){
//    Alamofire.request(.POST, address, parameters: params)
//      .responseJSON { (_, _, JSON, _) in
//        if let object = JSON as? NSDictionary {
//          var dataStr = object["name"] as! String
//          callBackToExecute(data: dataStr)
//        }
//    }
//  }
}


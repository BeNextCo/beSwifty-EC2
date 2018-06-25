//
//  ViewController.swift
//  BeSwifty
//
//  Created by Michel-Andre Chirita on 03/05/2018.
//  Copyright © 2018 benext. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - IBOutlet

  @IBOutlet weak var tableView: UITableView!

  // MARK: - Properties

  var drinks: [Drink]?

  var topView: UIView?
  var bottomView: UIView?
  var totalDrinksPrice: Int = 0 // à calculer...

  // MARK: - UIViewController

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

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }



  func only_natural_drinks(true: Bool) -> [Drink] {

    return drinks?.filter{ drink in
      return drink.traits?.traits.contains("natural") ?? false
    } ?? []

  }

}


fileprivate extension UserDefaults {

  var onboardingCompleted: Bool {
    get { return bool(forKey: #function) }
    set { set(newValue, forKey: #function) }
  }

}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        animate(cell.textLabel?.frame.origin.y = 100)
  }

  func truc() {
    make(print())
  }

  typealias closure = ()->()
  func animate(_ that: @autoclosure () -> ()) {

  }
  
}





// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.layer.cornerRadius = 5.0
    cell.backgroundColor = UIColor.lightGray
    cell.layer.borderWidth = 1
    cell.layer.borderColor = UIColor.blue.cgColor
    cell.textLabel?.text = "Boisson: \(self.drinks![indexPath.row]["name"])"
    return cell
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
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
//}


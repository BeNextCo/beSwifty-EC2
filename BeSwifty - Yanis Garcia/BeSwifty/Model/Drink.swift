//
//  Drink.swift
//  BeSwifty
//
//  Created by Michel-Andre Chirita on 03/05/2018.
//  Copyright © 2018 benext. All rights reserved.
//

import Foundation

struct Drink: Equatable {

  let name: String
  let origin: String
  let color: String?
  let price: String?
  let traits: TeaTrait?
}

extension Drink {
  init(name: String, origin: String) {
    self.name = name
    self.origin = origin
    self.color = nil
    self.price = nil
    self.traits = nil
  }
}

extension Drink: Comparable {
  static func < (lhs: Drink, rhs: Drink) -> Bool {
    return Int(lhs.price!)! < Int(rhs.price!)!
  }
}

//
//  ViewModel.swift
//  BeSwifty
//
//  Created by Michel-Andre Chirita on 03/05/2018.
//  Copyright © 2018 benext. All rights reserved.
//

import Foundation

struct ViewModel {

  let drinks: [Drink]

  init() {

    let coffee = Drink(name: "coffee", origin: "africa", color: "black", price: "2", traits: nil)
    let tea = Drink(name: "coffee", origin: "africa", color: "black", price: "6", traits: TeaTrait(traits: "energetic", "hot", "natural"))
    let cola = Drink(name: "coffee", origin: "africa", color: "black", price: "8", traits: nil)

    drinks = [coffee, tea, cola]
    drinks.sort(by: <)
  }
}

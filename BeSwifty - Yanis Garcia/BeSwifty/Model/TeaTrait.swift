//
//  TeaTrait.swift
//  BeSwifty
//
//  Created by Michel-Andre Chirita on 03/05/2018.
//  Copyright © 2018 benext. All rights reserved.
//

import Foundation

struct TeaTrait: Equatable{
  let traits: [String]
  init(traits: String...) {
    self.traits = traits
  }
}

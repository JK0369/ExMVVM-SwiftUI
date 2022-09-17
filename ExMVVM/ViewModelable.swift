//
//  ViewModelable.swift
//  ExMVVM
//
//  Created by 김종권 on 2022/09/17.
//

import SwiftUI
import Combine

protocol ViewModelable: ObservableObject {
  associatedtype Action
  associatedtype State
  
  var state: State { get }
  
  func action(_ action: Action)
}

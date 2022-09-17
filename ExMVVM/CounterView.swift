//
//  CounterView.swift
//  ExMVVM
//
//  Created by 김종권 on 2022/09/17.
//

import SwiftUI
import Combine

struct CounterView: View {
  // MARK: Properties
  @ObservedObject var viewModel: CounterViewModel
  
  // MARK: UI
  var body: some View {
    NavigationView {
      self.contentView
        .navigationTitle(Text("Counter 화면"))
    }
  }
  
  @ViewBuilder
  private var contentView: some View {
    switch viewModel.state {
    case let .count(int):
      VStack(alignment: .center, spacing: 20) {
        getCountView(count: int)
        HStack(alignment: .center, spacing: 50) {
          getSubtractButtonView()
          getAddButtonView()
        }
      }
    }
  }
  
  @ViewBuilder
  private func getSubtractButtonView() -> some View {
    Button("-") {
      viewModel.action(.onTapSubtractButton)
    }
    .font(.largeTitle)
  }
  
  @ViewBuilder
  private func getAddButtonView() -> some View {
    Button("+") {
      viewModel.action(.onTapAddButton)
    }
    .font(.largeTitle)
  }
  
  @ViewBuilder
  private func getCountView(count: Int) -> some View {
    Text("\(count)")
      .font(.title)
  }
}


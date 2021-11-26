//
//  ContentView.swift
//  marvel-app
//
//  Created by Gabriel Chaves Maziero on 22/11/21.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var viewModel = MarvelViewModel()
  @State private var show_modal: Bool = false
  @State var nextPage: Int = 1
  
  init() {
    viewModel.callFuncToGetMarvelData(0)
  }
  
  
  var body: some View {
    NavigationView{
      List(viewModel.result.indices, id: \.self) { resultIndex in
        let result = viewModel.result[resultIndex]
        ItemListView(hero: result, showModal: show_modal)
          .padding(8.0)
          .onAppear {
            if resultIndex == viewModel.result.count - 2 {
              viewModel.callFuncToGetMarvelData(nextPage)
              nextPage += 1
            }
          }
      }
      .navigationTitle("Heroes")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .preferredColorScheme(.light)
      ContentView()
        .preferredColorScheme(.dark)
    }
      
  }
}

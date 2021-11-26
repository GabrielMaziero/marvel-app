//
//  MarvelViewModel.swift
//  marvel-app
//
//  Created by Gabriel Chaves Maziero on 23/11/21.
//

import Foundation

class MarvelViewModel: ObservableObject {
  private var apiService = APIService()
  private var offset: Int = 0
  @Published var marvelData: MarvelData!
  @Published var result: [Result] = []
  @Published var loading: Bool = false
  
  
  func callFuncToGetMarvelData(_ nexPage: Int){
    loading = true
    if nexPage > 0 {
      offset += 20
    }
    self.apiService.getMarvelData(offset: offset){(marvelData) in
      self.marvelData = marvelData
      self.result.append(contentsOf: marvelData.dataClass.results)
      self.loading = false
    }
  }
}

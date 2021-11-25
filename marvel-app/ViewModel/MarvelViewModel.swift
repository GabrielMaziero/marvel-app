//
//  MarvelViewModel.swift
//  marvel-app
//
//  Created by Gabriel Chaves Maziero on 23/11/21.
//

import Foundation

class MarvelViewModel: ObservableObject {
    private var apiService = APIService()
    @Published var marvelData: MarvelData!
    @Published var result: [Result] = []
    
    
    func callFuncToGetMarvelData(){
        self.apiService.getMarvelData{(marvelData) in
            self.marvelData = marvelData
            self.result = marvelData.dataClass.results
        }
    }
}

//
//  ContentView.swift
//  marvel-app
//
//  Created by Gabriel Chaves Maziero on 22/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = MarvelViewModel()
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.fixed(160)),GridItem(.flexible())], spacing: 30, content: {
                ForEach(viewModel.result, id: \.id){
                    ItemListView(url: $0.thumbnail.url?.absoluteString, nameHero: $0.name)
                }
            }).padding()
        }
        .onAppear{
            self.viewModel.callFuncToGetMarvelData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

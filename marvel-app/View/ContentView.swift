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
    
    var columns: [GridItem] =
        Array(repeating: .init(.fixed(500)), count: 1)
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(viewModel.result, id: \.id){
                        ItemListView(hero: $0, showModal: show_modal)
                            .padding(8.0)
                    }
                    .navigationTitle("Heroes")
                }
            }
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

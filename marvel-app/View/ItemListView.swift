//
//  ItemListView.swift
//  marvel-app
//
//  Created by Gabriel Chaves Maziero on 24/11/21.
//

import SwiftUI

struct ItemListView: View {
    
    @State var url: String?
    @State var nameHero: String?
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: self.url ?? "")!
                       , placeholder: {
                        Image(systemName: "photo")
                            .frame(maxWidth: 180.0, maxHeight: 180.0)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
                       }, image: { Image(uiImage: $0).resizable() })
                .frame(maxWidth: 180.0, maxHeight: 180.0)
                .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
            Text(self.nameHero ?? "")
                .fontWeight(.bold)
                .lineLimit(1)
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(url:"http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/standard_amazing.jpg", nameHero: "HERO")
    }
}

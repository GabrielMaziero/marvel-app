//
//  ItemListView.swift
//  marvel-app
//
//  Created by Gabriel Chaves Maziero on 24/11/21.
//

import SwiftUI

struct ItemListView: View {
    
    @State var hero: Result?
    @State var showModal: Bool
    
    var body: some View {
        Button(action: {
            self.showModal = true
        }){
            HStack(alignment:.top){
                AsyncImage(url: URL(string: self.hero?.thumbnail.url?.absoluteString ?? "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/standard_amazing.jpg")!
                           , placeholder: {
                            Image(systemName: "photo")
                                .frame(width: 140.0, height: 180.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
                           }, image: { Image(uiImage: $0)})
                    .frame(width: 140.0, height: 180.0)
                    .cornerRadius(20,corners: [.topLeft,.bottomLeft])
                VStack(alignment:.leading){
                    Text(self.hero?.name ?? "Hero")
                        .font(.title2)
                        .fontWeight(.bold)
                        .accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                    Text(self.hero?.marvelDataDescription ?? "Description hero")
                        .font(.callout)
                        .fontWeight(.regular)
                        .lineLimit(4)
                        .accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                        .padding(.top)
                }
                .padding()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .background(Color.white
                            .cornerRadius(20)
                            .shadow(color: Color.gray.opacity(0.2), radius: 10, x:0,y: 10)
            )
            .sheet(isPresented: self.$showModal, content: {HeroDetailView(hero: hero)})
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(
            showModal: false
        )
    }
}

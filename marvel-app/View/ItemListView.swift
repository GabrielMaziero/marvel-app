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
  @Environment(\.colorScheme) var currentMode
  
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
          .cornerRadius(15,corners: [.topLeft,.bottomLeft])
        VStack(alignment:.leading){
          Text(self.hero?.name ?? "Hero")
            .font(.title2)
            .fontWeight(.bold)
            .accentColor(/*@START_MENU_TOKEN@*/Color("defaultText")/*@END_MENU_TOKEN@*/)
          Text(self.hero?.marvelDataDescription ?? "Description hero")
            .font(.callout)
            .fontWeight(.regular)
            .lineLimit(4)
            .accentColor(/*@START_MENU_TOKEN@*/Color("defaultText")/*@END_MENU_TOKEN@*/)
            .padding(.top)
        }
        .padding()
      }
      .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
      .background(Color("backgroundCardHero")
                    .cornerRadius(15)
      )
      .sheet(isPresented: self.$showModal, content: {HeroDetailView(hero: hero)})
    }
  }
}

struct ItemListView_Previews: PreviewProvider {
  static var previews: some View {
    Group{
      ItemListView(
        showModal: false
      )
      .preferredColorScheme(.light)
      ItemListView(
        showModal: false
      )
      .preferredColorScheme(.dark)
    }
  }
}

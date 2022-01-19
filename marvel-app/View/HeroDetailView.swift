//
//  HeroDetailView.swift
//  marvel-app
//
//  Created by Gabriel Chaves Maziero on 25/11/21.
//

import SwiftUI

struct HeroDetailView: View {
  
  @State var hero: Result?
  
  var body: some View {
    ScrollView {
      VStack{
        HStack{
          AsyncImage(url: URL(string: self.hero?.thumbnail.url?.absoluteString ?? "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/standard_amazing.jpg")!
                     , placeholder: {
                      Image(systemName: "photo")
                        .frame(maxWidth: .infinity, maxHeight: 450)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
                     }, image: { Image(uiImage: $0).resizable() })
        }
        .frame(height: 450)
        VStack{
          Text(self.hero?.name ?? "Hero")
            .foregroundColor(Color("defaultText"))
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, maxHeight: 20,alignment: .leading)
          Text(self.hero?.marvelDataDescription ?? "Description hero")
            .foregroundColor(/*@START_MENU_TOKEN@*/Color("defaultText")/*@END_MENU_TOKEN@*/)
            .font(.body)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
            .padding(.top)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
          
        }
        .padding()
      }
    }
    .ignoresSafeArea()
  }
}

struct HeroDetailView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      HeroDetailView()
        .preferredColorScheme(.light)
      HeroDetailView()
        .preferredColorScheme(.dark)
    }
  }
}

//
//  Searchmusic.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

struct Searchmusic: View {
    @State private var selectImage = Image(systemName: "photo")
    @State private var showSelectPhoto = false
    
    @State private var name = ""
    @State private var showSearchitem = false
    
    var body: some View {

        NavigationView {
            VStack {
                Button(action: {
                    showSelectPhoto = true
                }) {
                    selectImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                }
                .sheet(isPresented: $showSelectPhoto) {
                    ImagePickerController(showSelectPhoto: self.$showSelectPhoto, selectImage: $selectImage)
                }.offset(y: -50)

                HStack {
                    SearchText(name: $name)

                    NavigationLink(
                        destination: SearchDetail(name: $name)){
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                    }
                }
            }
        }

    }
}

struct Searchmusic_Previews: PreviewProvider {
    static var previews: some View {
        Searchmusic()
    }
}

struct SearchText: View {
    @Binding var name: String
    var body: some View {
        TextField("周杰倫", text: $name)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.blue, lineWidth: 2))
            
    }
}

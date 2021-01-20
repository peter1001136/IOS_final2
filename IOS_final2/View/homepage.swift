//
//  homepage.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

struct homepage: View {
    
    var body: some View {
        TabView{
            Searchmusic()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("搜尋")
                }
            FeaturesView()
                .tabItem {
                    Image(systemName: "wand.and.rays")
                    Text("特色歌單")
                }
            NewhitsView()
                .tabItem {
                    Image(systemName: "scope")
                    Text("新歌")
                }
            
        }
    }
}

struct homepage_Previews: PreviewProvider {
    static var previews: some View {
        homepage()
    }
}


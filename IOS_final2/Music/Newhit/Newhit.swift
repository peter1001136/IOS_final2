//
//  Newhit.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import Foundation

struct Newhitsrc: Codable {
    let data: [NewhitInfo]
}

struct NewhitInfo: Codable, Identifiable {
    let id: String
    let title: String
    let description: String?
    let url: URL
    let images: [NewhitImages]
}

struct NewhitImages: Codable {
    let height: Int
    let width: Int
    let url: URL
}

class NewhitData: ObservableObject {
    @Published var newhitData = [NewhitInfo]()
}


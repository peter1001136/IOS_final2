//
//  Feature.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import Foundation

struct Featuresrc: Codable {
    let data: [FeatureInfo]
}

struct FeatureInfo: Codable, Identifiable {
    let id: String
    let title: String
    let description: String?
    let url: URL
    let images: [FeatureImage]
}

struct FeatureImage: Codable {
    let height: Int
    let width: Int
    let url: URL
}

class FeatureData: ObservableObject {
    @Published var featureData = [FeatureInfo]()
}

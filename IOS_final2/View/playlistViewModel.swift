//
//  playlistViewModel.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI
import Foundation

class playlistViewModel: ObservableObject {
    @Published var playlists = [PlaylistInfo]()
    @Published var tracks = [SearchTrackInfo]()
    @Published var featureplaylist = [FeatureInfo]()
    @Published var newhitplaylist = [NewhitInfo]()
    
    let token = "8xk6I3GXYPc7q68TiViEXA=="
    
    func fetchplaylist(name: String, type: String) {
        let urlStr = "https://api.kkbox.com/v1.1/search?q=\(name)&territory=TW&limit=10&type=\(type)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        var request = URLRequest(url: URL(string: urlStr)!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data {
                do {
                    let playlistResults = try decoder.decode(Searchsrc.self, from: data)
                    DispatchQueue.main.async {
                        self.playlists = playlistResults.playlists.data
                    }
                } catch  {
                    print(error)
                }
            }
        }.resume()
    }
    
    func fetchtracks(name: String, type: String) {
        let urlStr = "https://api.kkbox.com/v1.1/search?q=\(name)&territory=TW&limit=20&type=\(type)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        var request = URLRequest(url: URL(string: urlStr)!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data {
                do {
                    let playlistResults = try decoder.decode(SearchTracksrc.self, from: data)
                    DispatchQueue.main.async {
                        self.tracks = playlistResults.tracks.data
                    }
                } catch  {
                    print(error)
                }
            }
        }.resume()
    }
    
    func fetchfeature() {
        let urlStr = "https://api.kkbox.com/v1.1/featured-playlists?territory=TW"
        var request = URLRequest(url: URL(string: urlStr)!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let featureResults = try decoder.decode(Featuresrc.self, from: data)
                    DispatchQueue.main.async {
                        self.featureplaylist = featureResults.data
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func fetchnewhit() {
        let urlStr = "https://api.kkbox.com/v1.1/new-hits-playlists?territory=TW"
        var request = URLRequest(url: URL(string: urlStr)!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let newhitResults = try decoder.decode(Newhitsrc.self, from: data)
                    DispatchQueue.main.async {
                        self.newhitplaylist = newhitResults.data
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

struct playlistViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}


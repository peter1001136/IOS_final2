//
//  TrackViewModel.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI
import Foundation

class TrackViewModel: ObservableObject {
    @Published var featuretracks = [TrackInfo]()
    let token = "8xk6I3GXYPc7q68TiViEXA=="
    
    func fetchfeauretracks(id: String) {
        let urlStr = "https://api.kkbox.com/v1.1/featured-playlists/:\(id)/tracks?territory=TW"
        var request = URLRequest(url: URL(string: urlStr)!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let trackResults = try decoder.decode(Tracksrc.self, from: data)
                    DispatchQueue.main.async {
                        self.featuretracks = trackResults.data
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    

}

struct TrackViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

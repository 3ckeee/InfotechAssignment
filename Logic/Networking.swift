//
//  Networking.swift
//  InfotechAssignment
//
//  Created by Erik Kokinda on 20/01/2023.
//

import Foundation

class NetworkManager: ObservableObject {
    static let shared = NetworkManager()
    @Published var actors: [Actor] = []
    func downloadData(completion: @escaping (Result?) -> ()) {
        let url = URL(string: "https://www.infotech.sk/Service/Service.svc/getData")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let json: [String: String] = ["APIKey": "1ff7e612-52ec-4bf0-899a-3bb29b07a43c"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let result = try JSONDecoder().decode(Result.self, from: data)
                DispatchQueue.main.async {
                    self.actors = result.actors
                }
                completion(result)
                print(self.actors)
            } catch let error {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }

        }.resume()
    }
}

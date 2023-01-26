//
//  MasterView.swift
//  InfotechAssignment
//
//  Created by Erik Kokinda on 20/01/2023.
//

import Foundation
import SwiftUI

struct MasterView: View {
    @ObservedObject var networkManager = NetworkManager.shared
    
    var body: some View {
        NavigationView {
            List(networkManager.actors.indices, id: \.self) { index in
                NavigationLink(destination: DetailView(actor: self.networkManager.actors[index])) {
                    VStack(alignment: .leading) {
                        Text(self.networkManager.actors[index].name)
                            .font(.headline)
                        Text(self.networkManager.actors[index].description)
                            .font(.subheadline)
                        ImageView(url: self.networkManager.actors[index].image)
                    }
                }
            }
            .navigationBarTitle("Actors")
            .onAppear(){
                self.networkManager.downloadData(completion: { result in
                    DispatchQueue.main.async {
                        if let result = result {
                            self.networkManager.actors = result.actors
                        } else {
                            print("Error fetching data")
                        }
                    }
                })
            }
        }
    }
}

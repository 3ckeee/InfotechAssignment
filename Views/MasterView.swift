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
                VStack(alignment: .leading) {
                    Text(networkManager.actors[index].name)
                        .font(.headline)
                    Text(networkManager.actors[index].description)
                        .font(.subheadline)
                    ImageView(url: networkManager.actors[index].image)
                }
                .onTapGesture {
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

//
//  DetailView.swift
//  InfotechAssignment
//
//  Created by Erik Kokinda on 25/01/2023.
//

import Foundation
import SwiftUI

struct DetailView: View {
    var actor: Actor

    var body: some View {
        VStack(alignment: .leading) {
            Text(actor.name)
                .font(.title)
            ImageView(url: actor.image)
            Text(actor.description)
                .font(.body)
            Text("DOB: \(actor.dob)")
                .font(.body)
            Text("Country: \(actor.country)")
                .font(.body)
            Text("Gender: \(actor.gender)")
                .font(.body)
            Text("Height: \(actor.height)")
                .font(.body)
            Text("Spouse: \(actor.spouse)")
                .font(.body)
            Text("Wiki: \(actor.wiki)")
                .font(.body)
        }
    }
}


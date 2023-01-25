//
//  ImageView.swift
//  InfotechAssignment
//
//  Created by Erik Kokinda on 20/01/2023.
//

import Foundation
import SwiftUI

struct ImageView: View {
    var url: String
    var body: some View {
        AsyncImage(
            url: URL(string: url)!
        )
    }
}

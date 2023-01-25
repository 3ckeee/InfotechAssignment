//
//  Actor.swift
//  InfotechAssignment
//
//  Created by Erik Kokinda on 20/01/2023.
//

import Foundation


struct Actor: Codable {
    var children: String
    var country: String
    var description: String
    var dob: String
    var gender: String
    var height: String
    var image: String
    var name: String
    var spouse: String
    var wiki: String
}

struct Result: Decodable {
    let actors: [Actor]
}

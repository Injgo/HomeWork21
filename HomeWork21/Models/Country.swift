//
//  Country.swift
//  HomeWork21
//
//  Created by Dato on 11.08.22.
//

import Foundation

struct Country: Codable{
    let name: String
    let capital: String?
    let alpha2Code : String
    let population : Int
    let flags: Flags
}


struct Flags: Codable {
    let svg: URL
    let png: URL
}



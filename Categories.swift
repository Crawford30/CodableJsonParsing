//
//  Categories.swift
//  imageData
//
//  Created by JOEL CRAWFORD on 2/12/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import Foundation

struct Categories: Codable {
    var success: Bool
    var data: [Data]
    //var message: String?
}


struct Data: Codable {
    var id: Int
    var name: String //?
    var image: String //?
    var description: String?
    var service_count: Int
    var created_at: String //?
    var updated_at: String?
    
}

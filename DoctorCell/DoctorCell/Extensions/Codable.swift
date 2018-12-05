//
//  Codable.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 04/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

extension Decodable {
    init?(from: [String: Any]) {
        do {
            let data = try JSONSerialization.data(withJSONObject: from, options: .prettyPrinted)
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:sszzz"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            self = try decoder.decode(Self.self, from: data)
        } catch {
            return nil
        }
    }
}

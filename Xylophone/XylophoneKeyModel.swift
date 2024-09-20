//
//  XylophoneKeyModel.swift
//  Xylophone
//
//  Created by murad on 20.09.2024.
//

import UIKit

struct XylophoneKey {
    let title: String
    let color: UIColor
}

struct XylophoneData {
    static let keys: [XylophoneKey] = [
        XylophoneKey(title: "C", color: .systemRed),
        XylophoneKey(title: "D", color: .systemOrange),
        XylophoneKey(title: "E", color: .systemYellow),
        XylophoneKey(title: "F", color: .systemGreen),
        XylophoneKey(title: "G", color: .systemIndigo),
        XylophoneKey(title: "A", color: .systemBlue),
        XylophoneKey(title: "B", color: .systemPurple)
    ]
}

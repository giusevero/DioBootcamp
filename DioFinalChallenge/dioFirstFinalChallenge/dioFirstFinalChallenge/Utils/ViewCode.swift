//
//  ViewCode.swift
//  DioFirstFinalChallenge
//
//  Created by Giugliano Severo on 12/09/23.
//

import Foundation

protocol ViewCode {
    func addSubviews()
    func setupConstraints()
    func setupStyle()
}

extension ViewCode {
    func setup() {
        addSubviews()
        setupConstraints()
        setupStyle()
    }
}

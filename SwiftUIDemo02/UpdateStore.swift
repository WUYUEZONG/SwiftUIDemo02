//
//  UpdateStore.swift
//  SwiftUIDemo02
//
//  Created by Ginokeo on 2021/1/11.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

//
//  main.swift
//  MyCreditManager2
//
//  Created by 강조은 on 2023/04/30.
//

import Foundation

func start() {
    MyCreditManager.shared.showMenu()
    do {
        try MyCreditManager.shared.selectMenu()
    } catch { print(error) }
    start()
}

start()

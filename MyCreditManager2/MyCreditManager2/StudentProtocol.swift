//
//  StudentProtocol.swift
//  MyCreditManager2
//
//  Created by 강조은 on 2023/05/01.
//

import Foundation

protocol MenuProtocol {
    func addStudent() throws
    func deleteStudent() throws
    func addGrade() throws
    func deleteGrade() throws
    func printScore() throws
}

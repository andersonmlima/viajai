//
//  CategorySelection.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 30/09/23.
//

import Foundation

protocol CategorySelectionDelegate {
    func didSelectCategory(category: Category, toRemove: Bool)
}

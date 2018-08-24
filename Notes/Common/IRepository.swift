//
//  IRepository.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class IRepository<T> {
    func loadAllAsync(delegate: RepositoryDelegate<T>) {}
    func addAsync(item: T) {}
    func deleteAsync(item: T) {}
}

class RepositoryDelegate<T> {
    func onDataLoaded(data: [T]) { }
    func onDataError() { }
}

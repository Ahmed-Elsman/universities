//
//  PresenterState.swift
//  universities
//
//  Created by Ahmed Elsman on 15/07/2024.
//

import Foundation

enum PresenterState<T> {
    case loading
    case loaded(data: T)
    case error(error: APIError)
}

protocol PresenterStatusProtocol: AnyObject {
    associatedtype Data
    
    var state: PresenterState<Data> { get set }
}

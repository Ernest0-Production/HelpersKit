//
//  File.swift
//  
//
//  Created by Ernest Babayan on 21.05.2021.
//

import UIKit


public extension UITableView {
    @discardableResult
    func register<Cell: UITableViewCell>(
        _ cellClass: Cell.Type,
        with identifier: String? = nil
    ) -> Self {
        register(cellClass, forCellReuseIdentifier: identifier ?? Id(Cell.self))
        return self
    }
    
    func dequeue<Cell: UITableViewCell>(
        _ cellClass: Cell.Type,
        with identifier: String? = nil,
        at indexPath: IndexPath
    ) -> Cell {
        dequeueReusableCell(
            withIdentifier: identifier ?? Id(cellClass),
            for: indexPath
        ) as! Cell
    }
}

public extension UICollectionView {
    @discardableResult
    func register<Cell: UICollectionViewCell>(
        _ cellClass: Cell.Type,
        with identifier: String? = nil,
        at indexPath: IndexPath
    ) -> Self {
        register(cellClass, forCellWithReuseIdentifier: identifier ?? Id(Cell.self))
        return self
    }
    
    func dequeue<Cell: UICollectionViewCell>(
        _ cellClass: Cell.Type,
        with identifier: String? = nil,
        at indexPath: IndexPath
    ) -> Cell {
        dequeueReusableCell(
            withReuseIdentifier: identifier ?? Id(cellClass),
            for: indexPath
        ) as! Cell
    }
}

private func Id<Cell>(_ cellClass: Cell.Type) -> String {
    String(describing: cellClass)
}

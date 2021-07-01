//
//  File.swift
//  
//
//  Created by Ernest Babayan on 20.05.2021.
//

import RxSwift
import XCTest
import CoreHelpersKit
import FunctionalHelpersKit
import UIHelpersKit
import RxCoreHelpersKit
import RxUIHelpersKit


final class Tests: XCTestCase {
    func test_latestDisposable() {
        var count = 0
        
        let disps: [Disposable] = [
            Disposables.create { count += 1 },
            Disposables.create { count += 1 },
            Disposables.create { count += 1 },
        ]
        
        let source = Observable<Disposable>.create({ observer in
            disps.forEach(observer.onNext)
            
            return Disposables.create { count += 1 }
        })
        
        XCTAssertEqual(count, 0)
        
        let disposable = LatestDisposable(source)
        
        XCTAssertEqual(count, 2)
        
        disposable.dispose()
        XCTAssertEqual(count, 4)
        
        addTeardownBlock { [weak disposable] in
            XCTAssertNil(disposable)
        }
    }
    
    func test_observableState() {
        let state = ObservableState<Bool>(
            sync: { true },
            async: .just(true)
        )
        
        XCTAssertTrue(state.value)
        
        let exp = expectation(description: "observable")
        state.observable.subscribe(onNext: { result in
            XCTAssertTrue(result)
            exp.fulfill()
        }).ignoringDispose()
        
        wait(for: [exp], timeout: 0)
        
        addTeardownBlock { [weak state] in
            XCTAssertNil(state)
        }
    }
    
    func test_recursion() {
        var counter = 0
        
        let function: (Int) -> Void = recursive { value, function in
            counter += 1
            
            if value > 4 { return }

            function(value + 1)
        }
        
        function(0)
        XCTAssertEqual(counter, 6)
    }
    
    func test_imageView_resizable() {
        let imageView: UIImageView = UIImageView(image: UIImage(size: CGSize.square(1)))
        
        imageView.resizable()

        XCTAssertEqual(imageView.constraints.count, 1)
    }
}

private extension UIImage {
    convenience init?(size: CGSize) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        UIColor.clear.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

private final class Weak<T: AnyObject> {
    init(value: T) {
        self.value = value
    }
    
    weak var value: T?
}

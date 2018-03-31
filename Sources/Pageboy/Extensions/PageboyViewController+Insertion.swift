//
//  PageboyViewController+Insertion.swift
//  Pageboy
//
//  Created by Merrick Sapsford on 31/03/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit

public extension PageboyViewController {
    
    public func insertPage(at index: PageIndex) {
        guard let pageViewController = self.pageViewController else {
            return
        }
        
        guard let oldPageCount = self.pageCount,
            let newPageCount = dataSource?.numberOfViewControllers(in: self) else {
                return
        }
        assert(newPageCount > oldPageCount,
               "Attempt to insert page at \(index) but there are only \(newPageCount) pages after the update")
        
        self.viewControllerCount = newPageCount
        guard let newViewController = dataSource?.viewController(for: self, at: index) else {
            return
        }
        
        if index == currentIndex { // replace current view controller
            UIView.transition(with: pageViewController.view,
                              duration: 0.25,
                              options: .transitionCrossDissolve, animations: {
                                self.updateViewControllers(to: [newViewController],
                                                           animated: false,
                                                           async: true,
                                                           completion: nil)
            }, completion: nil)
        }
    }
}

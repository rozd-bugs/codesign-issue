//
//  CodeSignIssueExtension.swift
//  CodeSignIssue
//
//  Created by Max Rozdobudko on 9/15/19.
//  Copyright © 2019 Max Rozdobudko. All rights reserved.
//

import Foundation

@objc
open class CodeSignIssueExtension: NSObject {

    @objc
    public static var isSupported: Bool {
        return true
    }

}

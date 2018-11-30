//
//  File.swift
//  FinalA
//
//  Created by Christopher Cavazos on 11/26/18.
//  Copyright © 2018 Christopher Cavazos. All rights reserved.
//

import Foundation


struct Formula: Hashable{
    static func == (lhs: Formula, rhs: Formula) -> Bool {
        return lhs.formula==rhs.formula
    }
    
    var set = Set<String>()
    var formula : String = ""
    
    init(_ f:String,_ s:Array<String>){
        self.formula = f
        self.set = Set<String>(s)
    }
}

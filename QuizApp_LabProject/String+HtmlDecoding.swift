//
//  String+HtmlDecoding.swift
//  QuizApp_LabProject
//
//  Created by Thiên Trân on 2020-11-18.
//

import Foundation

extension String {
    
    var htmlDecoded: String? {
        let data = Data(utf8)
        let decodedString = try? NSAttributedString(data: data, options: [.documentType:NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        
        return decodedString?.string
    }
    
}

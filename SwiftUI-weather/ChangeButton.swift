//
//  ChangeButton.swift
//  SwiftUI-weather
//
//  Created by Richard Kweku Aikins  on 31/03/2024.
//

import Foundation
import SwiftUI

struct ChangeButton: View {
    var title: String;
    var textColor: Color;
    var bgColor: Color;
    
    var body: some View {
        
        Text(title)
            .frame(width: 280, height: 50)
            .background(bgColor)
            .foregroundColor(textColor)
            .cornerRadius(20)
        
    }
}


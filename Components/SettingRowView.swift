//
//  SettingRowView.swift
//  solmal
//
//  Created by Jin Jung on 2023/09/25.
//

import SwiftUI

struct SettingRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
    }
}

//
//  ListRowItemView.swift
//  Devote
//
//  Created by Adriancys Jesus Villegas Toro on 23/8/23.
//

import SwiftUI

struct ListRowItemView: View {
    // MARK: - properties
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item : Item
    
    // MARK: - body
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical, 12)
                .animation(.default)
        }//:Toggle
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange) { _ in
            if self.viewContext.hasChanges {
                try?  self.viewContext.save()
            }
        }
    }
}



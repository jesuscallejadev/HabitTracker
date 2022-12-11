//
//  AddHabit.swift
//  HabitTracker
//
//  Created by Jesus Calleja on 11/12/22.
//


import SwiftUI

struct AddHabit: View {
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                TextField("Description", text: $description)
            }
            .background(.black)
            .scrollContentBackground(.hidden)
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let item = HabitItem(name: name, description: description, count: 0)
                    habits.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}


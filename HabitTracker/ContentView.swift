//
//  ContentView.swift
//  HabitTracker
//
//  Created by Jesus Calleja on 9/12/22.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var habits = Habits()
    @State private var showingAddHabit = false


    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]

    }



    private func removeHabits(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(habits.items.enumerated()), id: \.offset) { index, item in
                    NavigationLink {
                        HabitDetail(habits: habits, selectedHabitIndex: index)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                    .bold()
                                    .foregroundColor(.white)
                                Text(item.description)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 200, height: 50, alignment: .leading)

                            Spacer()

                            Text(String(item.count))
                                .frame(width: 30, height: 30)
                                .background(Circle().fill(Color.white).shadow(radius: 3))

                            Spacer()

                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 7)
                                .foregroundColor(.white)
                        }
                    }

                    .listRowSeparatorTint(.white)

                    .listRowBackground(Color.black)
                }
                .onDelete(perform: removeHabits)
            }.overlay(Group {
                if(habits.items.isEmpty) {
                    ZStack() {
                        Color.black.ignoresSafeArea()
                        Text("You don't have habits yet!")
                            .foregroundColor(.white)
                    }
                }
            })
            .background(.black)
            .scrollContentBackground(.hidden)
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("HabitTracker")

        }
        .sheet(isPresented: $showingAddHabit) {
            AddHabit(habits: habits)
        }
        .background(.black)

    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

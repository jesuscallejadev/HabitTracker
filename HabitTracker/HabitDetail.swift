//
//  HabitDetail.swift
//  HabitTracker
//
//  Created by Jesus Calleja on 11/12/22.
//

import Foundation


import SwiftUI

struct HabitDetail: View {
    @ObservedObject var habits: Habits
    var selectedHabitIndex: Int

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(habits.items[selectedHabitIndex].description)
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                HStack {
                    Text("Times completed: ")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                    Text(String(habits.items[selectedHabitIndex].count))
                        .foregroundColor(.white)
                        .font(.system(size: 16))

                    Spacer()

                    Button {
                        habits.items[selectedHabitIndex].count += 1
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)

                    }
                    .frame(width: 30, height: 30)
                    .background(Circle().fill(Color.white).shadow(radius: 3))

                    Button {
                        if( habits.items[selectedHabitIndex].count != 0) {
                            habits.items[selectedHabitIndex].count -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                            .foregroundColor(.black)

                    }
                    .frame(width: 30, height: 30)
                    .background(Circle().fill(Color.white).shadow(radius: 3))
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.top, 24)
            .padding(.leading, 16)
            .background(.black)
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .navigationTitle(habits.items[selectedHabitIndex].name)
    }
}

struct HabitDetail_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetail(habits: Habits(), selectedHabitIndex: 0)
    }
}



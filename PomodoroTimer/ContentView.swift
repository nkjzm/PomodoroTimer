//
//  ContentView.swift
//  PomodoroTimer
//
//  Created by 中地功貴 on 2021/02/02.
//

import SwiftUI


struct ContentView: View {
    @State private var number : Int  = 15
    
    func CountDown()
    {
        number -= 1
    }

    var body: some View {
        VStack {
        Text("Hello, world!")
            .padding()
        Text(String(number))
            .padding()
        Button(action: {
            CountDown()
        }) {
            Text("アップロード")
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

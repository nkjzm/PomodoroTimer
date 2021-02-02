//
//  ContentView.swift
//  PomodoroTimer
//
//  Created by 中地功貴 on 2021/02/02.
//

import SwiftUI


struct ContentView: View {
    @State private var number:Int  = 15
    @State var timeVal = 1
    @State var timerScreenShow:Bool = false
    
    func CountDown()
    {
        number -= 1
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Timer \(self.timeVal) seconds").font(.body)
                Picker(selection: self.$timeVal, label: Text("")) {
                    Text("1").tag(1).font(.title2)
                    Text("5").tag(5).font(.title2)
                    Text("10").tag(10).font(.title2)
                    Text("30").tag(30).font(.title2)
                    Text("60").tag(60).font(.title2)
                }
                NavigationLink(
                    destination: TimerView(timerScreenShow: self.$timerScreenShow, timeVal: self.timeVal),
                    isActive: self.$timerScreenShow,
                    label: {
                        Text("Start")
                    })
                    .padding()
                Text(String(number))
                Button(action: {
                    CountDown()
                }) {
                    Text("アップロード")
                }
            }
        }
    }
}

struct TimerView: View {
    @Binding var timerScreenShow:Bool
    @State var timeVal:Int
    
    var body: some View {
        if timeVal > -1 {
            VStack {
                Text("\(self.timeVal)").font(.system(size: 40))
                    .onAppear() {
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                            if self.timeVal > -1 {
                                self.timeVal -= 1
                            }
                        }
                    }
                Button(action: {
                    self.timerScreenShow = false
                }, label: {
                    Text("Cancel")
                        .foregroundColor(Color.red)
                })
                .padding(.top)
            }
        } else {
            Button(action: {
                self.timerScreenShow = false
            }, label: {
                Text("Done!")
                    .font(.title)
                    .foregroundColor(Color.green)
            }).onAppear() {
                //WKInterfaceDevice.current().play(.notification)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

//
//  ContentView.swift
//  22Example
//
//  Created by ishio on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.black, .red, .green, .blue, .cyan]
    var colornames = ["Black", "Red", "Green", "Blue", "Cyan"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var welcomeText: String = "WELCOME SWIFTUI !"
    
    var body: some View{
        VStack{
            Spacer()
            Text(welcomeText)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(self.rotation))
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: rotation
                )
                .foregroundColor(self.colors[self.colorIndex])
            Spacer()
            Divider()
            Picker(selection: $colorIndex, label: Text("Colors")) {
                ForEach (0 ..< colornames.count, id: \.self){
                    Text(self.colornames[$0])
                        .foregroundColor(self.colors[$0])
                }
            }
            .padding()
            Slider(value: $rotation, in: 0...360, step: 0.1)
                .padding()
            
            TextField("여기에 텍스트를 입력하세요", text: $welcomeText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

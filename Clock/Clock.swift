//
//  SwiftUIView.swift
//  Clock
//
//  Created by Michael Stebel on 3/20/23.
//

import SwiftUI

struct Clock: View {
    @State var time = Date()

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 200, height: 200)

            ForEach(0..<60) { tick in
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 2, height: tick % 5 == 0 ? 15 : 5)
                    .offset(y: 80)
                    .rotationEffect(.degrees(Double(tick) * 6))
            }

            Rectangle()
                .fill(Color.black)
                .frame(width: 2, height: 60)
                .offset(y: 20)
                .rotationEffect(.degrees(Double(Calendar.current.component(.hour, from: time)) * 30 - 180))
            Capsule()
                .fill(Color.black)
                .frame(width: 6, height: 40)
                .offset(y: 35)
                .rotationEffect(.degrees(Double(Calendar.current.component(.hour, from: time)) * 30 - 180))
           
            Rectangle()
                .fill(Color.black)
                .frame(width: 2, height: 90)
                .offset(y: 15)
                .rotationEffect(.degrees(Double(Calendar.current.component(.minute, from: time)) * 6 - 180))
            Capsule()
                .fill(Color.black)
                .frame(width: 6, height: 50)
                .offset(y: 40)
                .rotationEffect(.degrees(Double(Calendar.current.component(.minute, from: time)) * 6 - 180))
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 2, height: 100)
                .offset(y: 20)
                .rotationEffect(.degrees(Double(Calendar.current.component(.second, from: time)) * 6 - 180))

        }
        .onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.time = Date()
            }
            RunLoop.current.add(timer, forMode: .common)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Clock()
    }
}

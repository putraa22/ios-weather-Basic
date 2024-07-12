//
//  ContentView.swift
//  ios-weather
//
//  Created by Putra on 17/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @State private var animationCount = 0
    
    
    
    var body: some View {
        ZStack {
            ExtractedViewLinear(isNight: isNight)
            
            VStack {
                Text("Jakarta, ID")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 10) {
                    ExtractedViewImage(animationCount: animationCount, isNight: isNight)
                    
                    Text("78°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 60)
                
                
                HStack(spacing: 15) {
                    ExtractedView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 76)
                    ExtractedView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 76)
                    ExtractedView(dayOfWeek: "THU", imageName: "cloud.drizzle.fill", temperature: 76)
                    ExtractedView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 76)
                    ExtractedView(dayOfWeek: "SAT", imageName: "snowflake", temperature: 76)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                    animationCount += 1
                } label: {
                    WeatherButton(title:"Change Day Time", textColor: .white, backgroundColor: .blue)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
             
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct ExtractedViewLinear: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct ExtractedViewImage: View {
     var animationCount: Int
    var isNight: Bool
 
    
    var body: some View {
        Image( systemName: isNight ? "cloud.moon.fill" : "cloud.sun.fill")
            .symbolRenderingMode(.multicolor)
            .resizable()
            .foregroundStyle(.white, .blue)
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
            .symbolEffect(
                .bounce,
                value: animationCount
            )
    }
}

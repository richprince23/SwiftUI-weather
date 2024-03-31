//
//  ContentView.swift
//  SwiftUI-weather
//
//  Created by Richard Kweku Aikins  on 31/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedCity = "Edumfa";
    @State var isDarkMode = false;
    
    var body: some View {
        
        ZStack {
            BackgroundView(topColor: Color.blue, bottomColor: Color("lightBlue"))
            VStack (spacing: 30){
                CityTextView(cityName: "\(selectedCity), GH")
            
               MainWeatherStatusView(iconName: "cloud.sun.fill", temp: 33)
                                
                HStack(spacing: 20){
                    WeatherDayView(day: "Tue", imgName: "cloud.sun.fill", temp: 23)
                    WeatherDayView(day: "Wed", imgName: "sun.dust.fill", temp: 25)
                    WeatherDayView(day: "Thu", imgName: "cloud.heavyrain.fill", temp: 18)
                    WeatherDayView(day: "Fri", imgName: "cloud.sun.fill", temp: 24)
                    WeatherDayView(day: "Sat", imgName: "cloud.moon.bolt.fill", temp: 15)
                }
                Spacer()
                Button{
                    print("tapped")
                    selectedCity = "Abaka";
                } label: {
                    ChangeButton(title: "Change Day Time", textColor: Color.white, bgColor: .blue)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var day: String;
    var imgName: String;
    var temp: Int;
    
    var body: some View {
        VStack {
            Text("\(day)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            Image(systemName: "\(imgName)")
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color;
    var bottomColor: Color;
    
    var body: some View {
       
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading,
                       endPoint: .bottomTrailing).ignoresSafeArea()
    }
}


struct CityTextView: View{
    var cityName: String;
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var iconName: String;
    var temp: Int;
    
    var body: some View {
        VStack(spacing: 10, content: {
            Image(systemName: "\(iconName)")
                .renderingMode(.original)
                .resizable()
                .frame(width: 180, height: 120)
            Text("\(temp)°").foregroundColor(.white).font(.system(size: 70, weight: .medium))
        }).padding(20 )
    }
}


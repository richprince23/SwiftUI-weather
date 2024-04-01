//
//  ContentView.swift
//  SwiftUI-weather
//
//  Created by Richard Kweku Aikins  on 31/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedCity = "Edumfa";
    @State private var isDarkMode = false;
    
    var body: some View {
        
        ZStack {
            BackgroundView(isDarkMode: $isDarkMode)
            VStack (spacing: 30){
                CityTextView(cityName: "\(selectedCity), GH")
            
                MainWeatherStatusView(iconName:isDarkMode ? "moon.stars.fill" : "cloud.sun.fill", temp: 33)
                                
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
                    isDarkMode = !isDarkMode;
                } label: {
                    isDarkMode == false ? ChangeButton(title: "Change Day Time", textColor: Color.white, bgColor: .blue) : ChangeButton(title: "Change Day Time", textColor: Color.white, bgColor: .black)
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
    
    @Binding var isDarkMode: Bool;
    
    var body: some View {
       
        LinearGradient(gradient: Gradient(colors: [!isDarkMode ? .blue : .black, isDarkMode ? Color("lightBlue") : .white]), startPoint: .topLeading,
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
                .resizable()
                .renderingMode(.original)
                .frame(width: 200, height: 160)
            Text("\(temp)°").foregroundColor(.white).font(.system(size: 70, weight: .medium))
        }).padding(20 )
    }
}

